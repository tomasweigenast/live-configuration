import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/repository/query.dart';

abstract class StoreBase {
  Future write(String id, Map<String, Object?> data);
  Future delete(String id);
  Future<Map<String, Object?>?> read(String id);
  Future<PaginatedIterable<Map<String, Object?>>> readMany(Query query);
}