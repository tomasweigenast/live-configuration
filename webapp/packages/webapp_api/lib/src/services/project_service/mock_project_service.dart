import 'package:webapp_api/src/models/project/project_usage.dart';
import 'package:webapp_api/src/models/project/project_settings.dart';
import 'package:webapp_api/src/models/project/project.dart';
import 'package:webapp_api/src/models/common/period.dart';
import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/api/api_response.dart';
import 'package:webapp_api/src/services/project_service/base_project_service.dart';

class MockProjectService extends BaseProjectService {
  @override
  Future<OperationStatus<Object>> deleteProject(String projectUid) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<Project?> findProject(String id) {
    // TODO: implement findProject
    throw UnimplementedError();
  }

  @override
  Future<OperationStatus<ProjectUsage>> findProjectUsage(String projectUid, {Period? period}) {
    // TODO: implement findProjectUsage
    throw UnimplementedError();
  }

  @override
  Future<PaginatedIterable<Project>> findProjects({required String organizationUid, String? nextPageToken}) {
    // TODO: implement findProjects
    throw UnimplementedError();
  }

  @override
  Future<OperationStatus<Object>> updateProject(String projectUid, {String? name, bool? isFavorited}) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }

  @override
  Future<OperationStatus<Object>> updateProjectSettings(String projectUid, {required ProjectSettings projectSettings}) {
    // TODO: implement updateProjectSettings
    throw UnimplementedError();
  }

}