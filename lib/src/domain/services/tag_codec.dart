import 'dart:typed_data';

import 'package:either_dart/either.dart';

import '../entities/entities.dart';
import '../failures/failures.dart';

/// Converte entre registradores brutos e valores de engenharia.
///
/// Serviço puro de domínio: não sabe de HTTP nem de WebSocket, só das
/// regras do Modbus (16 bits por endereço, valores largos em 2 endereços
/// consecutivos com ordem de palavra configurável).
class TagCodec {
  /// Cria um [TagCodec].
  const TagCodec();

  /// Decodifica a tag a partir de [rawAt], que devolve o valor bruto de um
  /// endereço (ou `null` se ele ainda não foi lido).
  TagValue? decode(TagDefinition tag, int? Function(int address) rawAt) {
    if (tag.isBoolean || tag.dataType == TagDataType.boolean) {
      final raw = rawAt(tag.address);
      return raw == null ? null : TagValue.boolean(raw != 0);
    }

    final first = rawAt(tag.address);
    if (first == null) return null;

    final double raw;
    switch (tag.dataType) {
      case TagDataType.uint16:
        raw = first.toDouble();
      case TagDataType.int16:
        raw = first.toSigned(16).toDouble();
      case TagDataType.uint32 || TagDataType.int32 || TagDataType.float32:
        final second = rawAt(tag.address + 1);
        if (second == null) return null;
        final (hi, lo) =
            tag.wordOrder == WordOrder.big ? (first, second) : (second, first);
        // Aritmética em vez de shift: no Web os operadores bit a bit são
        // de 32 bits com sinal e corromperiam valores acima de 2^31.
        final word = (hi % 0x10000) * 0x10000 + (lo % 0x10000);
        raw = switch (tag.dataType) {
          TagDataType.int32 => word.toSigned(32).toDouble(),
          TagDataType.float32 => _bitsToFloat(word),
          _ => word.toDouble(),
        };
      case TagDataType.boolean:
        return null; // tratado acima
    }

    return TagValue.number(raw * tag.scale + tag.offset);
  }

  /// Codifica [value] nos registradores a escrever a partir de
  /// `tag.address`. Valida escrita, faixa de engenharia e limites do tipo.
  Either<Failure, List<int>> encode(TagDefinition tag, TagValue value) {
    if (!tag.isWritable) return const Left(Failure.readOnly());

    switch (value) {
      case BooleanTagValue(:final value):
        if (!tag.isBoolean) {
          return const Left(Failure.validation('Esta tag espera um número.'));
        }
        return Right([if (value) 1 else 0]);

      case NumberTagValue(:final value):
        if (tag.isBoolean) {
          return const Left(Failure.validation('Esta tag espera ligado/desligado.'));
        }
        if (!value.isFinite) {
          return const Left(Failure.validation('Valor inválido.'));
        }
        final min = tag.min;
        final max = tag.max;
        if ((min != null && value < min) || (max != null && value > max)) {
          return Left(Failure.validation(
            'Valor fora da faixa permitida (${min ?? '-∞'} a ${max ?? '+∞'} ${tag.unit}).'
                .trim(),
          ));
        }
        if (tag.scale == 0) {
          return const Left(Failure.configuration('Tag com escala zero.'));
        }
        return _encodeNumber(tag, (value - tag.offset) / tag.scale);
    }
  }

  Either<Failure, List<int>> _encodeNumber(TagDefinition tag, double raw) {
    List<int> split32(int word) {
      final unsigned = word < 0 ? word + 0x100000000 : word;
      final hi = unsigned ~/ 0x10000;
      final lo = unsigned % 0x10000;
      return tag.wordOrder == WordOrder.big ? [hi, lo] : [lo, hi];
    }

    Either<Failure, int> checked(int value, int min, int max) {
      if (value < min || value > max) {
        return const Left(
          Failure.validation('Valor não cabe no tipo de dado do registrador.'),
        );
      }
      return Right(value);
    }

    final rounded = raw.round();
    return switch (tag.dataType) {
      TagDataType.uint16 => checked(rounded, 0, 0xFFFF).map((v) => [v]),
      TagDataType.int16 => checked(rounded, -0x8000, 0x7FFF)
          .map((v) => [v < 0 ? v + 0x10000 : v]),
      TagDataType.uint32 =>
        checked(rounded, 0, 0xFFFFFFFF).map((v) => split32(v)),
      TagDataType.int32 =>
        checked(rounded, -0x80000000, 0x7FFFFFFF).map((v) => split32(v)),
      TagDataType.float32 => Right(split32(_floatToBits(raw))),
      TagDataType.boolean =>
        const Left(Failure.validation('Esta tag espera ligado/desligado.')),
    };
  }

  static double _bitsToFloat(int word) {
    final data = ByteData(4)..setUint32(0, word);
    return data.getFloat32(0);
  }

  static int _floatToBits(double value) {
    final data = ByteData(4)..setFloat32(0, value);
    return data.getUint32(0);
  }
}
