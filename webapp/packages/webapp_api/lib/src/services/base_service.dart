import 'package:webapp_api/src/application.dart';
import 'package:webapp_api/src/dependency_injection/dependency_provider.dart';
import 'package:webapp_api/src/repository/repository_provider.dart';

abstract class BaseService<TModel> {
  late final DependencyProvider provider;
  late final RepositoryProvider repositoryProvider;

  BaseService() {
    provider = Application.instance.dependencyProvider;
    repositoryProvider = RepositoryProvider.instance;
  }
}