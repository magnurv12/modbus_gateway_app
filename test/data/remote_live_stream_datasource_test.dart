import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:modbus_supervisor/src/data/data.dart';

void main() {
  // Regressão: o erro de conexão ficava preso porque o onCancel aguardava
  // `sink.close()` de um socket que nunca abriu, e o app nunca reconectava.
  test('falha de conexão chega ao assinante com cancelOnError', () async {
    final dataSource = RemoteLiveStreamDataSource(
      Uri.parse('ws://127.0.0.1:1/ws'), // porta fechada: conexão recusada
      connectTimeout: const Duration(seconds: 3),
    );
    final result = Completer<Object>();

    dataSource.connect().listen(
      (_) {},
      onError: result.complete,
      onDone: () {
        if (!result.isCompleted) result.complete('done');
      },
      cancelOnError: true,
    );

    final outcome = await result.future.timeout(const Duration(seconds: 5));
    expect(FailureMapper.fromException(outcome).isTransient, isTrue);
  });
}
