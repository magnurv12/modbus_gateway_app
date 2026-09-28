import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';

part 'gateway_state.freezed.dart';

/// Estado da tela Gateway.
@freezed
sealed class GatewayState extends ViewModelState with _$GatewayState {
  const GatewayState._();

  /// Primeira carga.
  const factory GatewayState.loading() = GatewayStateLoading;

  /// Primeira carga falhou (não há dado anterior para mostrar).
  const factory GatewayState.error(Failure failure) = GatewayStateError;

  /// Dados carregados.
  const factory GatewayState.loaded({
    required GatewayHealth health,
    required DateTime updatedAt,
    @Default(false) bool refreshing,

    /// Falha da última atualização automática; os dados exibidos são os da
    /// última leitura bem-sucedida.
    Failure? refreshFailure,
  }) = GatewayStateLoaded;
}
