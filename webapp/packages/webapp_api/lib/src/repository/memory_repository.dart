import 'dart:collection';

import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/repository/base_repository.dart';
import 'package:webapp_api/src/repository/entity_base.dart';
import 'package:webapp_api/src/repository/query.dart';

class MemoryRepository<TModel extends EntityBase> extends BaseRepository<TModel> {
  final SplayTreeMap<String, _CacheItem<TModel>> _cache = SplayTreeMap();
  late final int? _maxItemsInCache;
  late final Duration? _itemsTtl;

  int _itemsInCache = 0;

  int get items => _itemsInCache;

  @override
  Future delete(String id) async {
    _cache.remove(id);
    _itemsInCache--;
  }

  @override
  Future<TModel?> findById(String id) async {
    var entity = _cache[id];
    if(entity == null) {
      return null;
    }

    if(entity.expirationTime != null && entity.expirationTime!.difference(DateTime.now()).inSeconds > 5) {
      await delete(id);
      return null;
    }

    return entity.entity;
  }

  @override
  Future<PaginatedIterable<TModel>> findWhere(Query? query) async {
    // Doing where searches on cache is not efficient. Instead search in local storage such as SQL or Hive.
    return PaginatedIterable<TModel>.empty();
  }

  @override
  Future save(String id, TModel model) async {
    _cache[id] = _CacheItem(entity: model, expirationTime: _itemsTtl == null ? null : DateTime.now().add(_itemsTtl!));
    _itemsInCache++;

    if(_maxItemsInCache != null && _itemsInCache >= _maxItemsInCache!) {
      _cache.remove(_cache.lastKey());
      _itemsInCache--;
    }
  }

  @override
  Future saveMany(Map<String, TModel> entities) async {
    var expiration =  _itemsTtl == null ? null : DateTime.now().add(_itemsTtl!);
    _cache.addAll(entities.map((key, value) => MapEntry(key, _CacheItem(entity: value, expirationTime: expiration))));

    int itemsLength = entities.length;
    _itemsInCache += itemsLength;

    Future.microtask(() {
      if(_maxItemsInCache != null && _itemsInCache >= _maxItemsInCache!) {
        for(int i = 0; i < itemsLength; i++) {
          _cache.remove(_cache.lastKey());
        }

        _itemsInCache -= itemsLength;
      }
    });
  }

  void setProps({required int? maxItemsInCache, required Duration? itemsTtl}) {
    _maxItemsInCache = maxItemsInCache;
    _itemsTtl = itemsTtl;
  }
}

class _CacheItem<TModel> {
  final TModel entity;
  final DateTime? expirationTime;

  _CacheItem({required this.entity, required this.expirationTime});
}