import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modbus_supervisor/src/domain/domain.dart';

class _MockGatewayRepository extends Mock implements IGatewayRepository {}

void main() {
  late _MockGatewayRepository repository;

  const block = ModbusBlock(
    table: ModbusTable.holding,
    slave: 1,
    functionCode: 6,
    startAddress: 0,
    values: [450],
  );

  setUpAll(() => registerFallbackValue(ModbusTable.holding));

  setUp(() {
    repository = _MockGatewayRepository();
    when(
      () => repository.write(
        table: any(named: 'table'),
        start: any(named: 'start'),
        values: any(named: 'values'),
        slave: any(named: 'slave'),
      ),
    ).thenAnswer((_) async => const Right(block));
  });

  group('ReadModbusBlockUseCase', () {
    test('valida limites antes de ocupar o barramento', () async {
      final useCase = ReadModbusBlockUseCase(repository);

      final tooMany = await useCase(
        table: ModbusTable.holding,
        start: 0,
        count: 126,
      );
      final overflow = await useCase(
        table: ModbusTable.coils,
        start: 65000,
        count: 1000,
      );
      final badSlave = await useCase(
        table: ModbusTable.input,
        start: 0,
        count: 1,
        slave: 0,
      );

      expect(tooMany.left, isA<ValidationFailure>());
      expect(overflow.left, isA<ValidationFailure>());
      expect(badSlave.left, isA<ValidationFailure>());
      verifyNever(
        () => repository.read(
          table: any(named: 'table'),
          start: any(named: 'start'),
          count: any(named: 'count'),
          slave: any(named: 'slave'),
        ),
      );
    });
  });

  group('WriteTagUseCase', () {
    const setpoint = TagDefinition(
      id: 'sp',
      name: 'Setpoint',
      table: ModbusTable.holding,
      address: 3,
      scale: 0.1,
      min: 0,
      max: 60,
    );

    test('codifica e escreve no endereço da tag', () async {
      final useCase = WriteTagUseCase(repository, const TagCodec());

      final result = await useCase(setpoint, const TagValue.number(45));

      expect(result.isRight, isTrue);
      verify(
        () => repository.write(
          table: ModbusTable.holding,
          start: 3,
          values: [450],
          slave: null,
        ),
      ).called(1);
    });

    test('não escreve valor fora da faixa', () async {
      final useCase = WriteTagUseCase(repository, const TagCodec());

      final result = await useCase(setpoint, const TagValue.number(99));

      expect(result.left, isA<ValidationFailure>());
      verifyZeroInteractions(repository);
    });
  });

  group('PulseTagUseCase', () {
    const reset = TagDefinition(
      id: 'reset',
      name: 'Reset',
      table: ModbusTable.coils,
      address: 3,
      dataType: TagDataType.boolean,
      momentary: true,
    );

    test('escreve true e depois false', () async {
      final useCase = PulseTagUseCase(
        WriteTagUseCase(repository, const TagCodec()),
        pulseWidth: Duration.zero,
      );

      final result = await useCase(reset);

      expect(result.isRight, isTrue);
      verifyInOrder([
        () => repository.write(
          table: ModbusTable.coils,
          start: 3,
          values: [1],
          slave: null,
        ),
        () => repository.write(
          table: ModbusTable.coils,
          start: 3,
          values: [0],
          slave: null,
        ),
      ]);
    });

    test('não envia o "false" se o "true" falhou', () async {
      when(
        () => repository.write(
          table: any(named: 'table'),
          start: any(named: 'start'),
          values: [1],
          slave: any(named: 'slave'),
        ),
      ).thenAnswer((_) async => const Left(Failure.slaveTimeout()));
      final useCase = PulseTagUseCase(
        WriteTagUseCase(repository, const TagCodec()),
        pulseWidth: Duration.zero,
      );

      final result = await useCase(reset);

      expect(result.left, isA<SlaveTimeoutFailure>());
      verifyNever(
        () => repository.write(
          table: any(named: 'table'),
          start: any(named: 'start'),
          values: [0],
          slave: any(named: 'slave'),
        ),
      );
    });
  });
}
