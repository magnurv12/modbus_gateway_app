import 'package:flutter/services.dart' show rootBundle;
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/env/env.dart';
import 'core/network/api_client.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/views/views.dart';

/// Registra as dependências do app.
///
/// * **singletons**: infraestrutura, repositórios e casos de uso — o
///   repositório ao vivo, em particular, precisa ser único (1 WebSocket);
/// * **factories**: view models — cada página recebe uma instância nova e
///   a descarta no `dispose`.
///
/// `USE_SIMULATOR` troca só os datasources: do repositório para cima nada
/// sabe se o outro lado é um ESP32 ou o simulador.
void setupInjector(Env env) {
  final getIt = GetIt.instance;

  getIt
    // Core
    ..registerSingleton<Env>(env)
    ..registerLazySingleton<http.Client>(http.Client.new)
    ..registerLazySingleton<ApiClient>(
      () => ApiClient(
        getIt(),
        baseUrl: env.baseUrl,
        timeout: env.requestTimeout,
      ),
    )
    // Domínio (serviços puros)
    ..registerLazySingleton<TagCodec>(TagCodec.new)
    ..registerFactory<AlarmTracker>(AlarmTracker.new);

  // Datasources
  if (env.useSimulator) {
    getIt
      ..registerLazySingleton<PlantSimulator>(PlantSimulator.new)
      ..registerLazySingleton<IGatewayDataSource>(
        () => SimulatedGatewayDataSource(getIt()),
      )
      ..registerLazySingleton<ILiveStreamDataSource>(
        () => SimulatedLiveStreamDataSource(getIt()),
      );
  } else {
    getIt
      ..registerLazySingleton<IGatewayDataSource>(
        () => RemoteGatewayDataSource(getIt()),
      )
      ..registerLazySingleton<ILiveStreamDataSource>(
        () => RemoteLiveStreamDataSource(
          env.wsUrl,
          connectTimeout: env.requestTimeout,
        ),
      );
  }

  getIt
    ..registerLazySingleton<IPlantDataSource>(
      () => AssetPlantDataSource(rootBundle),
    )
    // Repositórios
    ..registerLazySingleton<IGatewayRepository>(
      () => GatewayRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<IPlantRepository>(
      () => PlantRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<ILiveDataRepository>(
      () => LiveDataRepositoryImpl(
        getIt(),
        getIt(),
        interval: env.liveInterval,
      ),
    )
    ..registerLazySingleton<IAlarmRepository>(
      () => AlarmRepositoryImpl(getIt(), getIt()),
    )
    // Casos de uso
    ..registerLazySingleton<IGetPlantUseCase>(() => GetPlantUseCase(getIt()))
    ..registerLazySingleton<IWatchPlantLiveUseCase>(
      () => WatchPlantLiveUseCase(getIt()),
    )
    ..registerLazySingleton<ISetLiveStreamActiveUseCase>(
      () => SetLiveStreamActiveUseCase(getIt()),
    )
    ..registerLazySingleton<IReconnectLiveStreamUseCase>(
      () => ReconnectLiveStreamUseCase(getIt()),
    )
    ..registerLazySingleton<IWriteTagUseCase>(
      () => WriteTagUseCase(getIt(), getIt()),
    )
    ..registerLazySingleton<IPulseTagUseCase>(() => PulseTagUseCase(getIt()))
    ..registerLazySingleton<IGetGatewayHealthUseCase>(
      () => GetGatewayHealthUseCase(getIt()),
    )
    ..registerLazySingleton<IReadModbusBlockUseCase>(
      () => ReadModbusBlockUseCase(getIt()),
    )
    ..registerLazySingleton<IWriteModbusValuesUseCase>(
      () => WriteModbusValuesUseCase(getIt()),
    )
    ..registerLazySingleton<IWatchAlarmsUseCase>(
      () => WatchAlarmsUseCase(getIt()),
    )
    ..registerLazySingleton<IAcknowledgeAlarmUseCase>(
      () => AcknowledgeAlarmUseCase(getIt()),
    )
    // View models
    ..registerFactory<ShellViewModel>(
      () => ShellViewModel(getIt(), getIt(), getIt(), getIt(), getIt()),
    )
    ..registerFactory<DashboardViewModel>(
      () => DashboardViewModel(getIt(), getIt(), getIt()),
    )
    ..registerFactoryParam<EquipmentViewModel, String, void>(
      (equipmentId, _) => EquipmentViewModel(
        equipmentId,
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
        getIt(),
      ),
    )
    ..registerFactory<AlarmsViewModel>(
      () => AlarmsViewModel(getIt(), getIt(), getIt()),
    )
    ..registerFactory<ExplorerViewModel>(
      () => ExplorerViewModel(
        getIt(),
        getIt(),
        defaultSlave: env.defaultSlave,
      ),
    )
    ..registerFactory<GatewayViewModel>(
      () => GatewayViewModel(getIt(), getIt()),
    );
}
