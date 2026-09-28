// ignore_for_file: non_constant_identifier_names
import 'package:get_it/get_it.dart';

/// Abstração sobre o container de injeção de dependência.
///
/// As views nunca falam com o [GetIt] diretamente: resolvem seus
/// view models por [DM], o que mantém a troca de container localizada.
abstract class DependencyManager {
  /// Recupera uma instância registrada de [T].
  T get<T extends Object>();

  /// Recupera uma instância de [T] criada com o parâmetro [param]
  /// (registros `registerFactoryParam`).
  T getWithParam<T extends Object, P>(P param);

  /// Recupera uma instância de [T], ou `null` se não estiver registrada.
  T? getOrNull<T extends Object>();
}

/// Implementação de [DependencyManager] sobre o [GetIt].
class GetItDependencyManager implements DependencyManager {
  GetItDependencyManager._();

  static final GetItDependencyManager _instance = GetItDependencyManager._();

  /// Instância singleton.
  static GetItDependencyManager i() => _instance;

  @override
  T get<T extends Object>() => GetIt.instance<T>();

  @override
  T getWithParam<T extends Object, P>(P param) =>
      GetIt.instance<T>(param1: param);

  @override
  T? getOrNull<T extends Object>() {
    if (!GetIt.instance.isRegistered<T>()) return null;
    return GetIt.instance<T>();
  }
}

/// Acesso estático ao [DependencyManager], usado pelas views.
final DependencyManager DM = GetItDependencyManager.i();
