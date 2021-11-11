import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/helpers/helpers.dart';
import 'package:webapp_api/src/repository/base_repository.dart';
import 'package:webapp_api/src/repository/memory_repository.dart';
import 'package:webapp_api/src/repository/query.dart';

import 'entity_base.dart';

class ComposableRepository<TModel extends EntityBase> {
  final BaseRepository<TModel>? _cacheRepository, _localRepository, _remoteRepository;
  final ComposableRepositorySettings _settings;

  DateTime? _lastLiveSynchronization;
  DateTime? _nextLocalExpiration;

  DateTime? get lastSyncTime => _lastLiveSynchronization;

  ComposableRepository({
    BaseRepository<TModel>? cacheRepository,
    BaseRepository<TModel>? localRepository,
    BaseRepository<TModel>? remoteRepository,
    required ComposableRepositorySettings settings})
    : _cacheRepository = cacheRepository,
      _localRepository = localRepository,
      _remoteRepository = remoteRepository,
      _settings = settings {

    if(_cacheRepository is MemoryRepository<TModel>) {
      (_cacheRepository as MemoryRepository<TModel>).setProps(maxItemsInCache: settings.maxEntriesInCache, itemsTtl: settings.cacheTtl);
    }
  }

  Future delete(String id) {
    return Tasks.execute([
      _cacheRepository?.delete(id),
      _localRepository?.delete(id),
      _remoteRepository?.delete(id)
    ]);
  }

  Future<TModel?> findById(String id, {bool forceOnline = false}) async {
    TModel? result = forceOnline ? await _remoteRepository?.findById(id) : await _cacheRepository?.findById(id);
    if(result != null) {
      if(forceOnline) {
        _localRepository?.save(id, result);
        _cacheRepository?.save(id, result);
      }

      return result;
    } else {
      result = await _localRepository?.findById(id);
      if(result != null) {
        _cacheRepository?.save(id, result);
        return result;
      } else {
        result = await _remoteRepository?.findById(id);
        if(result != null) {
          _localRepository?.save(id, result);
          _cacheRepository?.save(id, result);
        }

        return result;
      }
    }
  }

  Future<PaginatedIterable<TModel>> findWhere(Query? query, {bool forceOnline = false}) async {
    PaginatedIterable<TModel>? result = forceOnline ? await _remoteRepository?.findWhere(query) : (_isLocalExpired() ? null : await _localRepository?.findWhere(query));
    if(result == null || result.isNotEmpty) {
      result = await _remoteRepository?.findWhere(query);
    }

    if(result != null && result.isNotEmpty) {
      _localRepository?.saveMany({for (var entity in result) entity.id : entity}).then((_) {
        _lastLiveSynchronization = DateTime.now(); // TODO: Save this to file
        _nextLocalExpiration = _settings.localDataTtl == null ? null : _lastLiveSynchronization!.add(_settings.localDataTtl!);
      });
    }

    return result ?? PaginatedIterable<TModel>.empty();
  }

  Future save(String id, TModel model) async {
    await _localRepository?.save(id, model);
    await _cacheRepository?.save(id, model);
  }

  Future saveMany(Map<String, TModel> entities) async {
    await _localRepository?.saveMany(entities);
    await _cacheRepository?.saveMany(entities);
  }


  bool _isLocalExpired() {
    return _nextLocalExpiration == null ? false : _nextLocalExpiration!.difference(DateTime.now()).inSeconds > 10;
  }
}

class ComposableRepositorySettings {
  
  /// If null, entries won't expire.
  final Duration? cacheTtl;

  /// The number of entries its allowed in cache. If the number is reached, 
  /// older items will be deleted.
  final int? maxEntriesInCache;

  /// The duration of entries in local storage until they are marked as invalid.
  final Duration? localDataTtl;

  ComposableRepositorySettings({required this.cacheTtl, required this.localDataTtl, required this.maxEntriesInCache});
}