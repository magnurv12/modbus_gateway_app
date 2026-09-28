/// Design system do supervisório.
///
/// Tokens (cores, espaçamento, raios, tipografia, movimento) são
/// `ThemeExtension`s registradas no [ThemeData] global e lidas pelo
/// `context` (`context.colors`, `context.spacing`, ...). Componentes `Ds*`
/// não conhecem o domínio: recebem strings, números e tons.
library;

export 'components/ds_charts.dart';
export 'components/ds_feedback.dart';
export 'components/ds_gauges.dart';
export 'components/ds_surfaces.dart';
export 'components/ds_value.dart';
export 'theme/app_theme.dart';
export 'theme/ds_context.dart';
export 'tokens/ds_colors.dart';
export 'tokens/ds_metrics.dart';
export 'tokens/ds_typography.dart';
