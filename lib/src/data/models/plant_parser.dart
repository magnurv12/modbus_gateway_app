import 'package:yaml/yaml.dart';

import '../../domain/domain.dart';

/// Erro de validação do mapa de tags, com o caminho do campo problemático.
class PlantConfigException implements Exception {
  /// Caminho, ex.: `equipments[1].tags[3].address`.
  final String path;

  /// O que está errado.
  final String reason;

  /// Cria uma [PlantConfigException].
  const PlantConfigException(this.path, this.reason);

  @override
  String toString() => '$path: $reason';
}

/// Converte o `plant.yaml` em [Plant], validando cada campo.
///
/// O mapa é editado à mão por quem integra o escravo, então erros precisam
/// apontar o lugar exato — não um `type 'Null' is not a subtype...`.
abstract final class PlantParser {
  /// Faz o parse do conteúdo YAML.
  static Plant parse(String source) {
    final Object? root;
    try {
      root = loadYaml(source);
    } on YamlException catch (e) {
      throw PlantConfigException('plant.yaml', 'YAML inválido: ${e.message}');
    }

    final plant = _map(_map(root, 'raiz')['plant'], 'plant');
    final equipmentsNode = _list(plant['equipments'], 'plant.equipments');
    final equipments = <Equipment>[];
    for (var i = 0; i < equipmentsNode.length; i++) {
      equipments.add(_equipment(equipmentsNode[i], 'equipments[$i]'));
    }

    _ensureUnique(
      equipments.map((e) => e.id),
      'equipments',
      'id de equipamento duplicado',
    );
    _ensureUnique(
      equipments.expand((e) => e.tags).map((t) => t.id),
      'tags',
      'id de tag duplicado',
    );

    return Plant(
      name: _string(plant['name'], 'plant.name'),
      site: _string(plant['site'], 'plant.site', fallback: ''),
      equipments: List.unmodifiable(equipments),
    );
  }

  static Equipment _equipment(Object? node, String path) {
    final map = _map(node, path);
    final tagsNode = _list(map['tags'], '$path.tags');
    return Equipment(
      id: _string(map['id'], '$path.id'),
      tag: _string(map['tag'], '$path.tag'),
      name: _string(map['name'], '$path.name'),
      type: _enum(
        EquipmentType.values,
        map['type'],
        '$path.type',
        fallback: EquipmentType.generic,
      ),
      description: _string(map['description'], '$path.description', fallback: ''),
      tags: List.unmodifiable([
        for (var i = 0; i < tagsNode.length; i++)
          _tag(tagsNode[i], '$path.tags[$i]'),
      ]),
    );
  }

  static TagDefinition _tag(Object? node, String path) {
    final map = _map(node, path);
    final table = _enum(ModbusTable.values, map['table'], '$path.table');

    final dataType = map['type'] == null
        ? (table.isBit ? TagDataType.boolean : TagDataType.uint16)
        : _dataType(map['type'], '$path.type');
    if (table.isBit != (dataType == TagDataType.boolean)) {
      throw PlantConfigException(
        '$path.type',
        table.isBit
            ? 'tabelas de bit (${table.path}) só aceitam type: bool'
            : 'type: bool só é válido em coils/discrete',
      );
    }

    final address = _int(map['address'], '$path.address');
    if (address < 0 || address + dataType.registers - 1 > ModbusTable.maxAddress) {
      throw PlantConfigException('$path.address', 'fora de 0–65535');
    }

    final slave = map['slave'] == null ? null : _int(map['slave'], '$path.slave');
    if (slave != null && (slave < 1 || slave > 247)) {
      throw PlantConfigException('$path.slave', 'deve estar entre 1 e 247');
    }

    final min = _doubleOrNull(map['min'], '$path.min');
    final max = _doubleOrNull(map['max'], '$path.max');
    if (min != null && max != null && min >= max) {
      throw PlantConfigException('$path.min', 'min deve ser menor que max');
    }

    final momentary = map['momentary'] == true;
    if (momentary && table != ModbusTable.coils) {
      throw PlantConfigException('$path.momentary', 'só se aplica a coils');
    }

    final alarmsNode =
        map['alarms'] == null ? const <Object?>[] : _list(map['alarms'], '$path.alarms');

    return TagDefinition(
      id: _string(map['id'], '$path.id'),
      name: _string(map['name'], '$path.name'),
      table: table,
      address: address,
      slave: slave,
      dataType: dataType,
      wordOrder: _enum(
        WordOrder.values,
        map['wordOrder'],
        '$path.wordOrder',
        fallback: WordOrder.big,
      ),
      scale: _doubleOrNull(map['scale'], '$path.scale') ?? 1,
      offset: _doubleOrNull(map['offset'], '$path.offset') ?? 0,
      decimals: map['decimals'] == null ? 0 : _int(map['decimals'], '$path.decimals'),
      unit: _string(map['unit'], '$path.unit', fallback: ''),
      min: min,
      max: max,
      primary: map['primary'] == true,
      momentary: momentary,
      onLabel: _string(map['onLabel'], '$path.onLabel', fallback: 'Ligado'),
      offLabel: _string(map['offLabel'], '$path.offLabel', fallback: 'Desligado'),
      alarms: List.unmodifiable([
        for (var i = 0; i < alarmsNode.length; i++)
          _alarm(alarmsNode[i], '$path.alarms[$i]', isBit: table.isBit),
      ]),
    );
  }

  static AlarmRule _alarm(Object? node, String path, {required bool isBit}) {
    final map = _map(node, path);
    final condition = _enum(AlarmCondition.values, map['when'], '$path.when');
    final analog =
        condition == AlarmCondition.above || condition == AlarmCondition.below;
    if (analog == isBit) {
      throw PlantConfigException(
        '$path.when',
        isBit ? 'tags digitais usam on/off' : 'tags analógicas usam above/below',
      );
    }
    final limit = _doubleOrNull(map['limit'], '$path.limit');
    if (analog && limit == null) {
      throw PlantConfigException('$path.limit', 'obrigatório para above/below');
    }
    return AlarmRule(
      condition: condition,
      severity: _enum(AlarmSeverity.values, map['severity'], '$path.severity'),
      message: _string(map['message'], '$path.message'),
      limit: limit,
    );
  }

  // ---------------------------------------------------------------------------
  // Leitores tipados
  // ---------------------------------------------------------------------------

  static Map<dynamic, dynamic> _map(Object? node, String path) {
    if (node is YamlMap) return node;
    if (node is Map) return node;
    throw PlantConfigException(path, 'esperado um objeto');
  }

  static List<Object?> _list(Object? node, String path) {
    if (node is YamlList) return node.toList();
    if (node is List) return node.cast<Object?>();
    throw PlantConfigException(path, 'esperada uma lista');
  }

  static String _string(Object? value, String path, {String? fallback}) {
    if (value == null && fallback != null) return fallback;
    if (value is String && value.trim().isNotEmpty) return value.trim();
    if (value is String && fallback != null) return fallback;
    throw PlantConfigException(path, 'texto obrigatório');
  }

  static int _int(Object? value, String path) {
    if (value is int) return value;
    throw PlantConfigException(path, 'esperado um número inteiro');
  }

  static double? _doubleOrNull(Object? value, String path) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    throw PlantConfigException(path, 'esperado um número');
  }

  static T _enum<T extends Enum>(
    List<T> values,
    Object? value,
    String path, {
    T? fallback,
  }) {
    if (value == null && fallback != null) return fallback;
    for (final v in values) {
      // YAML 1.1 lê on/off sem aspas como bool.
      final raw = switch (value) {
        true => 'on',
        false => 'off',
        _ => value,
      };
      if (v.name == raw) return v;
    }
    throw PlantConfigException(
      path,
      'valor "$value" inválido (use: ${values.map((v) => v.name).join(', ')})',
    );
  }

  static TagDataType _dataType(Object? value, String path) {
    if (value == 'bool') return TagDataType.boolean;
    return _enum(TagDataType.values, value, path);
  }

  static void _ensureUnique(Iterable<String> ids, String path, String reason) {
    final seen = <String>{};
    for (final id in ids) {
      if (!seen.add(id)) throw PlantConfigException(path, '$reason: "$id"');
    }
  }
}
