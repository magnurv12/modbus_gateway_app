import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:modbus_gateway_app/src/domain/domain.dart';
import 'package:modbus_gateway_app/src/presentation/design_system/design_system.dart';
import 'package:modbus_gateway_app/src/presentation/views/equipment/widgets/setpoint_sheet.dart';

void main() {
  const tag = TagDefinition(
    id: 'sp',
    name: 'Setpoint de frequência',
    table: ModbusTable.holding,
    address: 0,
    scale: 0.1,
    decimals: 1,
    unit: 'Hz',
    min: 0,
    max: 60,
  );

  Future<void> pumpSheet(WidgetTester tester) async {
    await initializeDateFormatting('pt_BR');
    await tester.pumpWidget(MaterialApp(
      theme: AppTheme.dark,
      home: const Scaffold(body: SetpointSheet(tag: tag, current: 45)),
    ));
  }

  testWidgets('digitar um valor válido atualiza o valor e habilita Enviar',
      (tester) async {
    await pumpSheet(tester);
    await tester.enterText(find.byType(TextField), '52,5');
    await tester.pump();

    expect(find.text('52,5'), findsNWidgets(2)); // campo + valor grande
    final send = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(send.onPressed, isNotNull);
  });

  testWidgets('valor fora da faixa mostra erro e bloqueia Enviar',
      (tester) async {
    await pumpSheet(tester);
    await tester.enterText(find.byType(TextField), '552,5');
    await tester.pump();

    expect(find.textContaining('Fora da faixa'), findsOneWidget);
    final send = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(send.onPressed, isNull);
  });
}
