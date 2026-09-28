import '../entities/entities.dart';

/// Dados ao vivo da planta via streaming.
///
/// Mantém **uma única** conexão compartilhada por todas as telas — o
/// firmware aceita no máximo 4 clientes WebSocket simultâneos.
abstract class ILiveDataRepository {
  /// Estado mais recente (síncrono).
  PlantLiveState get current;

  /// Emite o estado atual imediatamente e depois cada mudança. A primeira
  /// chamada abre a conexão e assina as tags de [plant].
  Stream<PlantLiveState> watch(Plant plant);

  /// Pausa (app em segundo plano) ou retoma o streaming.
  void setActive(bool active);

  /// Força uma nova tentativa de conexão imediatamente.
  void reconnectNow();
}
