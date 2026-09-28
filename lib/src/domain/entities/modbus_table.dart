/// As quatro tabelas de dados do Modbus expostas pelo gateway.
enum ModbusTable {
  /// Registradores de 16 bits leitura/escrita — parâmetros e setpoints.
  holding(isBit: false, isWritable: true, readFunction: 3),

  /// Registradores de 16 bits somente leitura — medições.
  input(isBit: false, isWritable: false, readFunction: 4),

  /// Bits leitura/escrita — saídas digitais e comandos.
  coils(isBit: true, isWritable: true, readFunction: 1),

  /// Bits somente leitura — entradas digitais e status.
  discrete(isBit: true, isWritable: false, readFunction: 2);

  /// `true` para tabelas de 1 bit (coils/discrete).
  final bool isBit;

  /// `true` se o gateway aceita `PUT` nessa tabela.
  final bool isWritable;

  /// Código de função Modbus usado na leitura.
  final int readFunction;

  const ModbusTable({
    required this.isBit,
    required this.isWritable,
    required this.readFunction,
  });

  /// Segmento usado nas rotas REST e no WebSocket (`holding`, `coils`, ...).
  String get path => name;

  /// Máximo de endereços por leitura (125 registradores / 2000 bits).
  int get maxReadCount => isBit ? 2000 : 125;

  /// Máximo de endereços por escrita em bloco (FC 15/16).
  static const int maxWriteCount = 64;

  /// Maior endereço Modbus válido.
  static const int maxAddress = 65535;

  /// Maior valor de um registrador de 16 bits.
  static const int maxRegisterValue = 65535;

  /// Converte o nome usado pela API/YAML. Lança [ArgumentError] se inválido.
  static ModbusTable parse(String value) {
    return ModbusTable.values.firstWhere(
      (t) => t.path == value,
      orElse: () =>
          throw ArgumentError.value(value, 'table', 'Tabela inválida'),
    );
  }
}
