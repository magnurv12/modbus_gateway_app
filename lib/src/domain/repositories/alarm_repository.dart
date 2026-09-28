import '../entities/entities.dart';

/// Lista de alarmes da planta, com estado de reconhecimento compartilhado
/// entre as telas (badge da navegação, painel, lista de alarmes).
abstract class IAlarmRepository {
  /// Emite a lista atual imediatamente e depois a cada mudança.
  Stream<List<Alarm>> watch(Plant plant);

  /// Reconhece um alarme.
  void acknowledge(String alarmId);

  /// Reconhece todos os alarmes.
  void acknowledgeAll();
}
