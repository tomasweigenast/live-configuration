import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/repository/query.dart';

import 'entity_base.dart';

abstract class BaseRepository<TModel extends EntityBase> {
  const BaseRepository();

  /// Finds an entity by id.
  Future<TModel?> findById(String id);

  /// Finds many entities appliying conditions.
  Future<PaginatedIterable<TModel>> findWhere(Query? query);

  /// Saves an entity.
  Future<void> save(String id, TModel model);

  /// Saves many entities at once.
  Future<void> saveMany(Map<String, TModel> entities);

  /// Deletes an entity.
  Future<void> delete(String id);
}