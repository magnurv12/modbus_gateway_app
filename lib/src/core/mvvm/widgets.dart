import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'viewmodel.dart';
import 'viewmodel_state.dart';

/// Reconstrói a UI a cada novo estado do [ViewModel].
class ViewModelBuilder<VM extends ViewModel<S>, S extends ViewModelState>
    extends BlocBuilder<VM, S> {
  /// Cria um [ViewModelBuilder].
  const ViewModelBuilder({
    super.key,
    required VM viewModel,
    required super.builder,
    super.buildWhen,
  }) : super(bloc: viewModel);
}

/// Reconstrói apenas quando o valor selecionado do estado muda.
class ViewModelSelector<VM extends ViewModel<S>, S extends ViewModelState, T>
    extends BlocSelector<VM, S, T> {
  /// Cria um [ViewModelSelector].
  const ViewModelSelector({
    super.key,
    required VM viewModel,
    required super.selector,
    required super.builder,
  }) : super(bloc: viewModel);
}

/// Escuta os efeitos de uso único de um view model com [ViewModelEffects].
class ViewModelEffectListener<E> extends StatefulWidget {
  /// Stream de efeitos (`viewModel.effects`).
  final Stream<E> effects;

  /// Callback chamado uma vez por efeito.
  final void Function(BuildContext context, E effect) onEffect;

  /// Subárvore.
  final Widget child;

  /// Cria um [ViewModelEffectListener].
  const ViewModelEffectListener({
    super.key,
    required this.effects,
    required this.onEffect,
    required this.child,
  });

  @override
  State<ViewModelEffectListener<E>> createState() =>
      _ViewModelEffectListenerState<E>();
}

class _ViewModelEffectListenerState<E>
    extends State<ViewModelEffectListener<E>> {
  StreamSubscription<E>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  @override
  void didUpdateWidget(covariant ViewModelEffectListener<E> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.effects != widget.effects) {
      unawaited(_subscription?.cancel());
      _subscribe();
    }
  }

  void _subscribe() {
    _subscription = widget.effects.listen((effect) {
      if (mounted) widget.onEffect(context, effect);
    });
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
