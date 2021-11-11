import 'package:webapp_api/src/dependency_injection/dependency_provider.dart';

/// Entry point of the application.
class Application {
  static final Application instance = Application._();
  Application._();

  late final DependencyProvider _provider;

  DependencyProvider get dependencyProvider => _provider;

  Future initiailize() async {
    _provider = DependencyProvider();
  }
}