import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/repository/base_repository.dart';
import 'package:webapp_api/src/repository/entity_base.dart';
import 'package:webapp_api/src/repository/query.dart';

class LocalRepository<TModel extends EntityBase> extends BaseRepository<TModel> {
  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<TModel?> findById(String id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<PaginatedIterable<TModel>> findWhere(Query? query) {
    // TODO: implement findWhere
    throw UnimplementedError();
  }

  @override
  Future<void> save(String id, TModel model) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> saveMany(Map<String, TModel> entities) {
    // TODO: implement saveMany
    throw UnimplementedError();
  }
  
}