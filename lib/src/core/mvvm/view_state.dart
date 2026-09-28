import 'dart:async';

import 'package:flutter/widgets.dart';

import 'dependency_manager.dart';
import 'viewmodel.dart';

/// Injeta um [ViewModel] na página e o descarta quando o widget é destruído.
///
/// IMPORTANTE: use apenas na página principal de cada feature; widgets
/// filhos recebem o view model (ou dados) por parâmetro.
abstract class ViewState<S extends StatefulWidget, M extends ViewModel>
    extends State<S> {
  /// View model injetado.
  late final M viewModel;

  /// Resolve o view model. Sobrescreva quando ele precisar de parâmetro
  /// (ex.: `DM.getWithParam<EquipmentViewModel, String>(widget.id)`).
  @protected
  M resolveViewModel() => DM.get<M>();

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    viewModel = resolveViewModel();
  }

  @override
  @mustCallSuper
  void dispose() {
    unawaited(viewModel.close());
    super.dispose();
  }
}
