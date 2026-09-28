import 'package:freezed_annotation/freezed_annotation.dart';

import 'tag.dart';

part 'plant.freezed.dart';

/// Tipo de equipamento — define o sinótico mostrado na tela.
enum EquipmentType {
  /// Reservatório/tanque.
  tank,

  /// Bomba/motor.
  pump,

  /// Válvula.
  valve,

  /// Painel elétrico/medidor.
  panel,

  /// Qualquer outro equipamento.
  generic,
}

/// Equipamento supervisionado e suas tags.
@freezed
abstract class Equipment with _$Equipment {
  const Equipment._();

  /// Cria um [Equipment].
  const factory Equipment({
    required String id,

    /// Identificação de campo (TAG ISA), ex.: `P-101`.
    required String tag,
    required String name,
    required EquipmentType type,
    @Default('') String description,
    required List<TagDefinition> tags,
  }) = _Equipment;

  /// Tags de um papel específico, na ordem do arquivo.
  List<TagDefinition> tagsWithRole(TagRole role) =>
      tags.where((t) => t.role == role).toList(growable: false);

  /// Tags destacadas no card.
  List<TagDefinition> get primaryTags =>
      tags.where((t) => t.primary).toList(growable: false);
}

/// Planta completa (sinótico) carregada do mapa de tags.
@freezed
abstract class Plant with _$Plant {
  const Plant._();

  /// Cria uma [Plant].
  const factory Plant({
    required String name,
    required String site,
    required List<Equipment> equipments,
  }) = _Plant;

  /// Todas as tags da planta.
  Iterable<TagDefinition> get allTags => equipments.expand((e) => e.tags);

  /// Equipamento pelo id, ou `null`.
  Equipment? equipmentById(String id) {
    for (final equipment in equipments) {
      if (equipment.id == id) return equipment;
    }
    return null;
  }

  /// Equipamento dono da tag, ou `null`.
  Equipment? equipmentOfTag(String tagId) {
    for (final equipment in equipments) {
      if (equipment.tags.any((t) => t.id == tagId)) return equipment;
    }
    return null;
  }
}
