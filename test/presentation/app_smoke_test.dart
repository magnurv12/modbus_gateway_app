import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:modbus_supervisor/src/app_widget.dart';
import 'package:modbus_supervisor/src/core/env/env.dart';
import 'package:modbus_supervisor/src/data/data.dart';
import 'package:modbus_supervisor/src/domain/domain.dart';
import 'package:modbus_supervisor/src/injector.dart';
import 'package:modbus_supervisor/src/presentation/views/views.dart';

/// Sobe o app inteiro contra o simulador e navega pelas quatro abas e pelo
/// detalhe de um equipamento — valida DI, rotas nomeadas e renderização.
void main() {
  setUp(() async {
    await initializeDateFormatting('pt_BR');
    setupInjector(
      Env(
        name: 'test',
        appName: 'Supervisório (teste)',
        baseUrl: Uri.parse('http://modbus-gateway.local'),
        wsPath: '/ws',
        requestTimeout: const Duration(seconds: 4),
        defaultSlave: 1,
        liveInterval: const Duration(milliseconds: 200),
        healthRefresh: const Duration(seconds: 5),
        useSimulator: true,
      ),
    );
  });

  tearDown(() => GetIt.instance.reset());

  testWidgets('navega pelo app com o simulador', (tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const AppWidget());
    // Carrega o YAML, conecta ao simulador e recebe os snapshots.
    await _settleIo(tester);

    expect(find.text('Estação de Bombeamento EB-01'), findsOneWidget);
    expect(find.text('Ao vivo'), findsOneWidget);
    expect(find.text('Reservatório'), findsOneWidget);

    await tester.tap(find.text('Motobomba'));
    // pumpAndSettle nunca termina: o indicador "ao vivo" pulsa sem parar.
    await _settleIo(tester);
    expect(find.text('P-101'), findsWidgets);
    await tester.scrollUntilVisible(
      find.text('COMANDOS'),
      400,
      scrollable: find
          .descendant(
            of: find.byType(EquipmentPage),
            matching: find.byWidgetPredicate(
              (w) => w is Scrollable && w.axisDirection == AxisDirection.down,
            ),
          )
          .first,
    );
    expect(find.text('Comando da bomba'), findsOneWidget);
    expect(find.text('Reset de falhas'), findsOneWidget);

    await tester.tap(find.text('Explorador'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('Explorador Modbus'), findsOneWidget);

    await tester.tap(find.text('Gateway').last);
    await _settleIo(tester);
    expect(find.text('Enlace Modbus ativo'), findsOneWidget);

    await tester.tap(find.text('Alarmes').last);
    await _settleIo(tester);
    expect(find.text('Crítico'), findsOneWidget);

    // Desmonta a árvore (timers das páginas) e encerra o streaming
    // (timers do repositório e do simulador) antes da checagem de timers.
    await tester.pumpWidget(const SizedBox());
    await (GetIt.instance<ILiveDataRepository>() as LiveDataRepositoryImpl)
        .dispose();
    await tester.pump(const Duration(seconds: 1));
  });
}

/// Alterna IO real (asset bundle) e tempo falso (timers do simulador) até a
/// árvore estabilizar.
Future<void> _settleIo(WidgetTester tester) async {
  for (var i = 0; i < 8; i++) {
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 50)),
    );
    await tester.pump(const Duration(milliseconds: 300));
  }
}
