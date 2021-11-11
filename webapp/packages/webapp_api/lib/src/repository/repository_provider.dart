import 'package:webapp_api/src/application.dart';
import 'package:webapp_api/src/repository/base_repository.dart';
import 'package:webapp_api/src/repository/composable_repository.dart';
import 'package:webapp_api/src/repository/entity_base.dart';

class RepositoryProvider {
  static const RepositoryProvider instance = RepositoryProvider._();
  const RepositoryProvider._();

  /// Gets or creates a new composable repository.
  ComposableRepository<T> getForType<T extends EntityBase>({
    ComposableRepositorySettings? settings,
    BaseRepository<T>? cacheRepository,
    BaseRepository<T>? localRepository,
    BaseRepository<T>? sourceRepository,
  }) {
    var repository = Application.instance.dependencyProvider.resolve<ComposableRepository<T>>();
    if(repository == null) {
      repository = ComposableRepository<T>(
        settings: ComposableRepositorySettings(
          cacheTtl: settings?.cacheTtl,
          localDataTtl: settings?.localDataTtl,
          maxEntriesInCache: settings?.maxEntriesInCache
        ),
        cacheRepository: cacheRepository,
        localRepository: localRepository,
        remoteRepository: sourceRepository
      );

      Application.instance.dependencyProvider.registerSingleton<ComposableRepository<T>>(instance: repository);
    }

    return repository;
  }
}