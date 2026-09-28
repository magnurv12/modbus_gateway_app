import 'dart:async';

import '../../../core/env/env.dart';
import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import 'gateway_state.dart';

/// View model da saúde do gateway, com atualização automática.
class GatewayViewModel extends ViewModel<GatewayState> {
  final IGetGatewayHealthUseCase _getHealth;
  final Env _env;
  Timer? _timer;

  /// Cria um [GatewayViewModel].
  GatewayViewModel(this._getHealth, this._env)
      : super(const GatewayState.loading());

  /// Endereço configurado.
  String get endpoint => _env.baseUrl.toString();

  /// Documentação Swagger embarcada no firmware.
  String get docsUrl => _env.baseUrl.replace(path: '/docs').toString();

  /// App rodando contra o simulador.
  bool get simulated => _env.useSimulator;

  /// Nome do ambiente.
  String get environment => _env.name;

  @override
  void initViewModel() {
    super.initViewModel();
    unawaited(load());
    _timer = Timer.periodic(_env.healthRefresh, (_) => refresh());
  }

  /// Carga completa (mostra loading).
  Future<void> load() async {
    emit(const GatewayState.loading());
    final result = await _getHealth();
    emit(result.fold(
      GatewayState.error,
      (health) => GatewayState.loaded(health: health, updatedAt: DateTime.now()),
    ));
  }

  /// Atualização silenciosa (pull-to-refresh e timer).
  Future<void> refresh() async {
    final current = state;
    if (current is! GatewayStateLoaded) {
      if (current is GatewayStateError) await load();
      return;
    }
    if (current.refreshing) return;
    emit(current.copyWith(refreshing: true));

    final result = await _getHealth();
    final latest = state;
    if (latest is! GatewayStateLoaded) return;
    emit(result.fold(
      (failure) => latest.copyWith(refreshing: false, refreshFailure: failure),
      (health) => GatewayState.loaded(health: health, updatedAt: DateTime.now()),
    ));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
