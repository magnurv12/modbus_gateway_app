import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show mustCallSuper;

import 'viewmodel_state.dart';

/// View model que encapsula o estado e as regras de apresentação,
/// conversando apenas com os casos de uso do domínio.
///
/// É um [Cubit] especializado: a view observa [state] e chama métodos
/// públicos; nunca emite estados diretamente. É descartado pelo
/// `ViewState` quando a página é destruída.
abstract class ViewModel<S extends ViewModelState> extends Cubit<S> {
  /// Indica se o view model já foi inicializado.
  bool isInitialized = false;

  /// Cria um [ViewModel] com o estado inicial e dispara [initViewModel].
  ViewModel(super.initialState) {
    initViewModel();
  }

  /// Chamado assim que o view model é criado. Sobrescreva para disparar a
  /// carga inicial de dados.
  @mustCallSuper
  void initViewModel() {
    assert(
      !isInitialized,
      'O ViewModel já foi inicializado. A inicialização acontece no '
      'construtor; não chame initViewModel manualmente.',
    );
    isInitialized = true;
  }

  @override
  void emit(S state) {
    if (!isClosed) super.emit(state);
  }
}

/// Canal de eventos de uso único (snackbar, navegação, haptics) que não
/// fazem parte do estado renderizável.
///
/// Guardar "mostre um snackbar" no estado faz o evento se repetir a cada
/// rebuild; um stream separado garante que cada efeito é consumido uma vez.
mixin ViewModelEffects<S extends ViewModelState, E> on ViewModel<S> {
  final StreamController<E> _effects = StreamController<E>.broadcast();

  /// Stream de efeitos consumida pela view (ex.: `ViewModelEffectListener`).
  Stream<E> get effects => _effects.stream;

  /// Publica um efeito para a view.
  void emitEffect(E effect) {
    if (!_effects.isClosed) _effects.add(effect);
  }

  @override
  Future<void> close() async {
    await _effects.close();
    return super.close();
  }
}
