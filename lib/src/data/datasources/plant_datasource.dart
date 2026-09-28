import 'package:flutter/services.dart' show AssetBundle;

import '../../domain/domain.dart';
import '../models/models.dart';

/// Fonte do mapa de tags da planta.
abstract class IPlantDataSource {
  /// Carrega e valida a planta. Lança [PlantConfigException] se inválida.
  Future<Plant> loadPlant();
}

/// Lê o mapa de tags de um asset YAML.
class AssetPlantDataSource implements IPlantDataSource {
  final AssetBundle _bundle;
  final String _assetPath;

  /// Cria um [AssetPlantDataSource].
  AssetPlantDataSource(
    this._bundle, {
    String assetPath = 'assets/plant/plant.yaml',
  }) : _assetPath = assetPath;

  @override
  Future<Plant> loadPlant() async {
    final source = await _bundle.loadString(_assetPath);
    return PlantParser.parse(source);
  }
}
