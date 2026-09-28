import 'package:freezed_annotation/freezed_annotation.dart';

import 'alarm.dart';
import 'modbus_table.dart';

part 'tag.freezed.dart';

/// Tipo de dado de uma tag e quantos registradores ele ocupa.
enum TagDataType {
  /// Inteiro sem sinal de 16 bits (1 registrador).
  uint16(registers: 1),

  /// Inteiro com sinal de 16 bits (1 registrador).
  int16(registers: 1),

  /// Inteiro sem sinal de 32 bits (2 registradores).
  uint32(registers: 2),

  /// Inteiro com sinal de 32 bits (2 registradores).
  int32(registers: 2),

  /// Ponto flutuante IEEE-754 de 32 bits (2 registradores).
  float32(registers: 2),

  /// Bit (coil/discrete input).
  boolean(registers: 1);

  /// Quantidade de endereços consecutivos ocupados.
  final int registers;

  const TagDataType({required this.registers});
}

/// Ordem das palavras em valores de 32 bits — varia entre fabricantes.
enum WordOrder {
  /// Palavra alta no primeiro registrador (padrão Modbus "big-endian").
  big,

  /// Palavra baixa no primeiro registrador ("word swap").
  little,
}

/// Papel da tag no supervisório, derivado da tabela Modbus.
enum TagRole {
  /// Medição analógica (input register).
  measurement,

  /// Status digital (discrete input).
  status,

  /// Comando digital (coil).
  command,

  /// Parâmetro/setpoint (holding register).
  setpoint,
}

/// Definição de uma tag: *o que* ler, *onde* e *como* interpretar.
@freezed
abstract class TagDefinition with _$TagDefinition {
  const TagDefinition._();

  /// Cria uma [TagDefinition].
  const factory TagDefinition({
    required String id,
    required String name,
    required ModbusTable table,
    required int address,

    /// Escravo Modbus; `null` usa o padrão do ambiente.
    int? slave,
    @Default(TagDataType.uint16) TagDataType dataType,
    @Default(WordOrder.big) WordOrder wordOrder,

    /// `engenharia = bruto * scale + offset`.
    @Default(1.0) double scale,
    @Default(0.0) double offset,
    @Default(0) int decimals,
    @Default('') String unit,

    /// Faixa de engenharia (usada em gauges e validação de escrita).
    double? min,
    double? max,

    /// Destacada no card do equipamento.
    @Default(false) bool primary,

    /// Coil de pulso: o app escreve `true` e, em seguida, `false`.
    @Default(false) bool momentary,
    @Default('Ligado') String onLabel,
    @Default('Desligado') String offLabel,
    @Default(<AlarmRule>[]) List<AlarmRule> alarms,
  }) = _TagDefinition;

  /// Papel da tag, derivado da tabela.
  TagRole get role => switch (table) {
        ModbusTable.input => TagRole.measurement,
        ModbusTable.discrete => TagRole.status,
        ModbusTable.coils => TagRole.command,
        ModbusTable.holding => TagRole.setpoint,
      };

  /// `true` para tags de 1 bit.
  bool get isBoolean => table.isBit;

  /// `true` se o operador pode escrever nesta tag.
  bool get isWritable => table.isWritable;

  /// Endereços ocupados pela tag.
  int get registerCount => dataType.registers;

  /// Último endereço ocupado (inclusivo).
  int get lastAddress => address + registerCount - 1;

  /// Escravo efetivo considerando o padrão do ambiente.
  int slaveOr(int defaultSlave) => slave ?? defaultSlave;
}
