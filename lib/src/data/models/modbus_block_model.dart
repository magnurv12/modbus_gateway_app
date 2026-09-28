import '../../domain/domain.dart';

/// Resposta de leitura/escrita de uma tabela.
///
/// A API devolve quatro formatos (bloco de registradores, bloco de bits,
/// registrador único, bit único). Em vez de quatro modelos, este parser
/// normaliza todos para endereço inicial + lista de valores inteiros.
class ModbusBlockModel {
  /// Tabela.
  final ModbusTable table;

  /// Escravo que respondeu.
  final int slave;

  /// Código de função usado.
  final int functionCode;

  /// Primeiro endereço.
  final int startAddress;

  /// Valores (bits como 0/1).
  final List<int> values;

  /// Respondido do cache de streaming.
  final bool cached;

  /// Idade do cache em ms.
  final int? ageMs;

  /// Cria um [ModbusBlockModel].
  const ModbusBlockModel({
    required this.table,
    required this.slave,
    required this.functionCode,
    required this.startAddress,
    required this.values,
    this.cached = false,
    this.ageMs,
  });

  /// Faz o parse de qualquer um dos formatos de resposta.
  ///
  /// Lança [FormatException] se o JSON não seguir o contrato.
  factory ModbusBlockModel.fromJson(Map<String, dynamic> json) {
    final table = ModbusTable.values.firstWhere(
      (t) => t.path == json['table'],
      orElse: () => throw FormatException('Tabela inválida: ${json['table']}'),
    );

    final int start;
    final List<int> values;
    if (json['registers'] case final List<dynamic> registers) {
      start = _int(json['startAddress'], 'startAddress');
      values = [
        for (final r in registers) _int((r as Map)['value'], 'registers.value'),
      ];
    } else if (json['states'] case final List<dynamic> states) {
      start = _int(json['startAddress'], 'startAddress');
      values = [for (final s in states) _bit(s)];
    } else if (json.containsKey('value')) {
      start = _int(json['address'], 'address');
      values = [_int(json['value'], 'value')];
    } else if (json.containsKey('state')) {
      start = _int(json['address'], 'address');
      values = [_bit(json['state'])];
    } else {
      throw const FormatException('Resposta sem registers/states/value/state.');
    }

    return ModbusBlockModel(
      table: table,
      slave: _int(json['slave'], 'slave'),
      functionCode: _int(json['functionCode'], 'functionCode'),
      startAddress: start,
      values: List.unmodifiable(values),
      cached: json['cached'] as bool? ?? false,
      ageMs: json['ageMs'] as int?,
    );
  }

  /// Converte para a entidade de domínio.
  ModbusBlock toEntity() => ModbusBlock(
    table: table,
    slave: slave,
    functionCode: functionCode,
    startAddress: startAddress,
    values: values,
    cached: cached,
    ageMs: ageMs,
  );

  static int _int(Object? value, String field) {
    if (value is int) return value;
    if (value is num) return value.toInt();
    throw FormatException('Campo "$field" ausente ou não numérico.');
  }

  static int _bit(Object? value) => switch (value) {
    true => 1,
    false => 0,
    final num n => n == 0 ? 0 : 1,
    _ => throw const FormatException('Estado de bit inválido.'),
  };
}
