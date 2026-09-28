import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'core/env/env.dart';
import 'core/mvvm/mvvm.dart';
import 'presentation/design_system/design_system.dart';
import 'presentation/router/app_router.dart';

/// Raiz do app: tema global, localização pt-BR e roteador.
class AppWidget extends StatefulWidget {
  /// Cria um [AppWidget].
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  late final GoRouter _router = buildAppRouter();
  final Env _env = DM.get<Env>();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: _env.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // Sala de controle: escuro por padrão; o tema claro (ISA-101) fica
      // disponível para uso em campo, sob sol.
      themeMode: ThemeMode.dark,
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routerConfig: _router,
    );
  }
}
