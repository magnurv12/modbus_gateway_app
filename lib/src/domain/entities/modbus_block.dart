import 'package:freezed_annotation/freezed_annotation.dart';

import 'modbus_table.dart';

part 'modbus_block.freezed.dart';

/// Bloco contíguo de endereços lido (ou escrito) em uma tabela Modbus.
///
/// Registradores e bits são unificados em [values]: bits viram `0`/`1`.
/// Isso mantém a decodificação de tags e o explorador independentes do
/// tipo de tabela.
@freezed
abstract class ModbusBlock with _$ModbusBlock {
  const ModbusBlock._();

  /// Cria um [ModbusBlock].
  const factory ModbusBlock({
    required ModbusTable table,
    required int slave,
    required int functionCode,
    required int startAddress,
    required List<int> values,

    /// `true` quando o gateway respondeu do cache de streaming.
    @Default(false) bool cached,

    /// Idade do valor em cache, quando [cached].
    int? ageMs,
  }) = _ModbusBlock;

  /// Quantidade de endereços do bloco.
  int get count => values.length;

  /// Último endereço (inclusivo).
  int get endAddress => startAddress + count - 1;

  /// Valor bruto de [address], ou `null` se fora do bloco.
  int? valueAt(int address) {
    final index = address - startAddress;
    if (index < 0 || index >= values.length) return null;
    return values[index];
  }
}
