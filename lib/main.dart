import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/app_widget.dart';
import 'src/core/env/env.dart';
import 'src/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final env = await Env.load();
  await initializeDateFormatting('pt_BR');
  setupInjector(env);

  runApp(const AppWidget());
}
