import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modbus_supervisor/src/domain/domain.dart';
import 'package:modbus_supervisor/src/presentation/views/equipment/equipment_state.dart';
import 'package:modbus_supervisor/src/presentation/views/explorer/explorer_state.dart';
import 'package:modbus_supervisor/src/presentation/views/views.dart';

class _GetPlant extends Mock implements IGetPlantUseCase {}

class _WatchLive extends Mock implements IWatchPlantLiveUseCase {}

class _WatchAlarms extends Mock implements IWatchAlarmsUseCase {}

class _WriteTag extends Mock implements IWriteTagUseCase {}

class _PulseTag extends Mock implements IPulseTagUseCase {}

class _Ack extends Mock implements IAcknowledgeAlarmUseCase {}

class _Read extends Mock implements IReadModbusBlockUseCase {}

class _WriteValues extends Mock implements IWriteModbusValuesUseCase {}

void main() {
  const pumpCmd = TagDefinition(
    id: 'cmd',
    name: 'Comando da bomba',
    table: ModbusTable.coils,
    address: 0,
    dataType: TagDataType.boolean,
    onLabel: 'Ligada',
  );
  const plant = Plant(
    name: 'P',
    site: 'S',
    equipments: [
      Equipment(
        id: 'p101',
        tag: 'P-101',
        name: 'Motobomba',
        type: EquipmentType.pump,
        tags: [pumpCmd],
      ),
    ],
  );
  const block = ModbusBlock(
    table: ModbusTable.coils,
    slave: 1,
    functionCode: 5,
    startAddress: 0,
    values: [1],
  );

  setUpAll(() {
    registerFallbackValue(plant);
    registerFallbackValue(pumpCmd);
    registerFallbackValue(const TagValue.boolean(true));
    registerFallbackValue(ModbusTable.holding);
  });

  group('EquipmentViewModel', () {
    late _GetPlant getPlant;
    late _WatchLive watchLive;
    late _WatchAlarms watchAlarms;
    late _WriteTag writeTag;

    setUp(() {
      getPlant = _GetPlant();
      watchLive = _WatchLive();
      watchAlarms = _WatchAlarms();
      writeTag = _WriteTag();
      when(() => getPlant()).thenAnswer((_) async => const Right(plant));
      when(
        () => watchLive(any()),
      ).thenAnswer((_) => Stream.value(PlantLiveState.initial));
      when(() => watchAlarms(any())).thenAnswer((_) => Stream.value(const []));
    });

    EquipmentViewModel build(String id) => EquipmentViewModel(
      id,
      getPlant,
      watchLive,
      watchAlarms,
      writeTag,
      _PulseTag(),
      _Ack(),
    );

    blocTest<EquipmentViewModel, EquipmentState>(
      'id inexistente → notFound',
      build: () => build('nope'),
      wait: Duration.zero,
      expect: () => [const EquipmentState.notFound('nope')],
    );

    test('comando marca pendente, confirma e emite efeito', () async {
      when(
        () => writeTag(any(), any()),
      ).thenAnswer((_) async => const Right(block));
      final vm = build('p101');
      await Future<void>.delayed(Duration.zero);
      final effects = <EquipmentEffect>[];
      vm.effects.listen(effects.add);

      final pendingSeen = expectLater(
        vm.stream,
        emitsThrough(
          isA<EquipmentStateLoaded>().having(
            (s) => s.pendingWrites,
            'pending',
            {'cmd'},
          ),
        ),
      );
      await vm.setCommand(pumpCmd, true);
      await pendingSeen;

      expect((vm.state as EquipmentStateLoaded).pendingWrites, isEmpty);
      await Future<void>.delayed(Duration.zero);
      expect(effects.single, isA<WriteConfirmed>());
      verify(() => writeTag(pumpCmd, const TagValue.boolean(true))).called(1);
      await vm.close();
    });

    test('falha de escrita vira efeito com a Failure', () async {
      when(
        () => writeTag(any(), any()),
      ).thenAnswer((_) async => const Left(Failure.slaveTimeout()));
      final vm = build('p101');
      await Future<void>.delayed(Duration.zero);
      final effects = <EquipmentEffect>[];
      vm.effects.listen(effects.add);

      await vm.setCommand(pumpCmd, false);
      await Future<void>.delayed(Duration.zero);

      expect(
        effects.single,
        isA<WriteFailed>().having(
          (e) => e.failure,
          'failure',
          isA<SlaveTimeoutFailure>(),
        ),
      );
      await vm.close();
    });
  });

  group('ExplorerViewModel', () {
    late _Read read;

    setUp(() => read = _Read());

    blocTest<ExplorerViewModel, ExplorerState>(
      'leitura com sucesso registra bloco e log',
      setUp: () => when(
        () => read(
          table: any(named: 'table'),
          start: any(named: 'start'),
          count: any(named: 'count'),
          slave: any(named: 'slave'),
        ),
      ).thenAnswer((_) async => const Right(block)),
      build: () => ExplorerViewModel(read, _WriteValues(), defaultSlave: 1),
      act: (vm) => vm.read(),
      expect: () => [
        isA<ExplorerState>().having(
          (s) => s.status,
          'status',
          ExplorerStatus.loading,
        ),
        isA<ExplorerState>()
            .having((s) => s.status, 'status', ExplorerStatus.success)
            .having((s) => s.block, 'block', block)
            .having((s) => s.log.single.ok, 'log ok', isTrue),
      ],
    );

    blocTest<ExplorerViewModel, ExplorerState>(
      'falha permanente desliga a leitura contínua',
      setUp: () => when(
        () => read(
          table: any(named: 'table'),
          start: any(named: 'start'),
          count: any(named: 'count'),
          slave: any(named: 'slave'),
        ),
      ).thenAnswer((_) async => const Left(Failure.validation('x'))),
      build: () => ExplorerViewModel(read, _WriteValues(), defaultSlave: 1),
      act: (vm) => vm.toggleAutoRefresh(),
      wait: const Duration(milliseconds: 10),
      verify: (vm) {
        expect(vm.state.autoRefresh, isFalse);
        expect(vm.state.status, ExplorerStatus.failure);
      },
    );
  });
}
