import 'package:flutter/services.dart' show AssetBundle, rootBundle;
import 'package:yaml/yaml.dart';

/// Nome do ambiente a carregar, escolhido em build/run com
/// `--dart-define=ENVIRONMENT=demo` (padrão: `dev`).
///
/// Só escolhe *qual* YAML carregar (`assets/env/env_<nome>.yaml`); os valores
/// ficam no arquivo, não no dart-define.
const String _environmentName = String.fromEnvironment(
  'ENVIRONMENT',
  defaultValue: 'dev',
);

/// Configuração do ambiente carregada de `assets/env/env_<ENVIRONMENT>.yaml`.
///
/// É um objeto imutável (e não estático) para poder ser registrado no
/// injetor e substituído em testes.
class Env {
  /// Nome do ambiente carregado (`dev`, `demo`, ...).
  final String name;

  /// Nome exibido do app.
  final String appName;

  /// URL base do gateway, ex.: `http://modbus-gateway.local`.
  final Uri baseUrl;

  /// Caminho do endpoint WebSocket de streaming.
  final String wsPath;

  /// Timeout das requisições HTTP.
  final Duration requestTimeout;

  /// Escravo Modbus padrão para tags sem `slave` próprio.
  final int defaultSlave;

  /// Intervalo pedido nas assinaturas WebSocket.
  final Duration liveInterval;

  /// Intervalo de atualização automática da tela Gateway.
  final Duration healthRefresh;

  /// Usa o simulador embutido em vez do gateway real.
  final bool useSimulator;

  /// Cria um [Env] com valores explícitos (útil em testes).
  const Env({
    required this.name,
    required this.appName,
    required this.baseUrl,
    required this.wsPath,
    required this.requestTimeout,
    required this.defaultSlave,
    required this.liveInterval,
    required this.healthRefresh,
    required this.useSimulator,
  });

  /// URL do WebSocket derivada de [baseUrl] (`http` → `ws`, `https` → `wss`).
  Uri get wsUrl => baseUrl.replace(
    scheme: baseUrl.scheme == 'https' ? 'wss' : 'ws',
    path: wsPath,
  );

  /// Carrega o YAML do ambiente selecionado. Deve ser aguardado uma vez no
  /// `main()`, depois de `WidgetsFlutterBinding.ensureInitialized()`.
  static Future<Env> load({AssetBundle? bundle}) async {
    final content = await (bundle ?? rootBundle).loadString(
      'assets/env/env_$_environmentName.yaml',
    );
    final yaml = loadYaml(content);
    if (yaml is! YamlMap) {
      throw const FormatException('Arquivo de ambiente vazio ou inválido.');
    }
    return Env.fromMap(_environmentName, yaml);
  }

  /// Constrói o [Env] a partir do mapa lido do YAML, validando cada campo.
  factory Env.fromMap(String name, Map<dynamic, dynamic> map) {
    T read<T>(String key, T fallback) {
      final value = map[key];
      if (value == null) return fallback;
      if (value is T) return value;
      throw FormatException('Variável "$key" deveria ser do tipo $T.');
    }

    final baseUrl = Uri.tryParse(read<String>('BASE_URL', '').trim());
    if (baseUrl == null || !baseUrl.hasScheme || baseUrl.host.isEmpty) {
      throw const FormatException('BASE_URL ausente ou inválida.');
    }

    return Env(
      name: name,
      appName: read<String>('APP_NAME', 'Modbus Gateway'),
      baseUrl: baseUrl,
      wsPath: read<String>('WS_PATH', '/ws'),
      requestTimeout: Duration(
        milliseconds: read<int>('REQUEST_TIMEOUT_MS', 4000),
      ),
      defaultSlave: read<int>('DEFAULT_SLAVE', 1),
      liveInterval: Duration(milliseconds: read<int>('LIVE_INTERVAL_MS', 500)),
      healthRefresh: Duration(
        milliseconds: read<int>('HEALTH_REFRESH_MS', 5000),
      ),
      useSimulator: read<bool>('USE_SIMULATOR', false),
    );
  }
}
