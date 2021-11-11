abstract class DependencyProvider {
  /// Resolves a dependency for a type.
  T? resolve<T extends Object>({String name = ""});

  /// Resolves a dependency for a type.
  T resolveRequired<T extends Object>({String name = ""});

  /// Resolves an async dependency for a type.
  Future<T?> resolveAsync<T extends Object>({String name = ""});

  /// Resolves an async dependency for a type.
  Future<T> resolveRequiredAsync<T extends Object>({String name = ""});

  /// Registers a new singleton.
  void registerSingleton<T extends Object>({String name = "", required T instance});

  /// Registers a new lazy singleton.
  void registerLazySingleton<T extends Object>({String name = "", required T Function() factory});

  /// Registers an async singleton.
  void registerAsyncSingleton<T extends Object>({String name = "", required Future<T> Function() factory});

  factory DependencyProvider({Map<Type, _DependencyBase>? dependencies}) => _DependencyProvider(dependencies: dependencies);
}

class _DependencyProvider implements DependencyProvider {
  final Map<Type, Map<String, _DependencyBase>> _dependencies = {};

  _DependencyProvider({Map<Type, _DependencyBase>? dependencies}) {
    if(dependencies != null) {
      _dependencies.addAll(dependencies.map((key, value) => MapEntry(key, {"": value})));
    }
  }
 
  @override
  T? resolve<T extends Object>({String name = ""}) {
    var dependencies = _dependencies[T];
    if(dependencies == null) {
      return null;
    }

    var dependency = dependencies[name];
    if(dependency == null) {
      return null;
    }

    if(dependency is _Dependency) {
      return dependency.resolver() as T;
    } else {
      throw Exception("Dependency $T is async. Must be called with resolveAsync().");
    }
  }

  @override
  Future<T?> resolveAsync<T extends Object>({String name = ""}) async {
    var dependencies = _dependencies[T];
    if(dependencies == null) {
      return null;
    }

    var dependency = dependencies[name];
    if(dependency == null) {
      return null;
    }

    if(dependency is _AsyncDependency) {
      return (await dependency.resolver()) as T;
    } else {
      return (dependency as _Dependency).resolver() as T;
    }
  }

  @override
  T resolveRequired<T extends Object>({String name = ""}) {
    var dependencies = _dependencies[T];
    if(dependencies == null) {
      throw Exception("Dependency for type $T not registered.");
    }

    var dependency = dependencies[name];
    if(dependency == null) {
      throw Exception("Dependency for type $T named '$name' not found.");
    }

    if(dependency is _Dependency) {
      return dependency.resolver() as T;
    } else {
      throw Exception("Dependency $T is async. Must be called with resolveAsync().");
    }
  }

  @override
  Future<T> resolveRequiredAsync<T extends Object>({String name = ""}) async {
    var dependencies = _dependencies[T];
    if(dependencies == null) {
      throw Exception("Dependency for type $T not registered.");
    }

    var dependency = dependencies[name];
    if(dependency == null) {
      throw Exception("Dependency for type $T named '$name' not registered.");
    }

    if(dependency is _AsyncDependency) {
      return (await dependency.resolver()) as T;
    } else {
      return (dependency as _Dependency).resolver() as T;
    }
  }

  @override
  void registerAsyncSingleton<T extends Object>({String name = "", required Future<T> Function() factory}) {
    var dependencies = _dependencies[T];
    if(dependencies == null) {
      dependencies = {};
      _dependencies[T] = dependencies;
    }

    dependencies[name] = _AsyncDependency(isLazy: false, name: name, resolver: factory);
  }

  @override
  void registerLazySingleton<T extends Object>({String name = "", required T Function() factory}) {
    var dependencies = _dependencies[T];
    if(dependencies == null) {
      dependencies = {};
      _dependencies[T] = dependencies;
    }

    dependencies[name] = _Dependency(isLazy: true, name: name, resolver: factory);
  }

  @override
  void registerSingleton<T extends Object>({String name = "", required T instance}) {
    var dependencies = _dependencies[T];
    if(dependencies == null) {
      dependencies = {};
      _dependencies[T] = dependencies;
    }

    dependencies[name] = _Dependency(isLazy: false, name: name, resolver: () => instance);
  }

}

class _DependencyBase<T extends Object> {
  final bool isLazy;
  final String name;

  const _DependencyBase({required this.name, required this.isLazy});
}

class _Dependency<T extends Object> extends _DependencyBase<T> {
  final T Function() resolver;

  const _Dependency({required this.resolver, required String name, required bool isLazy}) : super(name: name, isLazy: isLazy);
} 

class _AsyncDependency<T extends Object> extends _DependencyBase<T> {
  final Future<T> Function() resolver;

  const _AsyncDependency({required this.resolver, required String name, required bool isLazy}) : super(name: name, isLazy: isLazy);
} 