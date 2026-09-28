import 'package:flutter/foundation.dart' show immutable;

/// Estado imutável emitido por um `ViewModel`.
///
/// Cada tela define seus estados como subtipos `freezed` selados de
/// [ViewModelState], o que permite `switch` exaustivo na view.
@immutable
abstract class ViewModelState {
  /// Cria um [ViewModelState].
  const ViewModelState();
}
