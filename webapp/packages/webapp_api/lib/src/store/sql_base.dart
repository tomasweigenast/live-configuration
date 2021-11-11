import 'package:webapp_api/src/repository/query.dart';
import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/store/store_base.dart';

class SqlStore extends StoreBase {
  @override
  Future delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Map<String, Object?>?> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<PaginatedIterable<Map<String, Object?>>> readMany(Query query) {
    // TODO: implement readMany
    throw UnimplementedError();
  }

  @override
  Future write(String id, Map<String, Object?> data) {
    // TODO: implement write
    throw UnimplementedError();
  }

}