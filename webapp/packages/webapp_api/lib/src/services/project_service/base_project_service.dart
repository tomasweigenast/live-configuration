import 'package:webapp_api/src/api/api_response.dart';
import 'package:webapp_api/src/api/paginated_list.dart';
import 'package:webapp_api/src/models/common/period.dart';
import 'package:webapp_api/src/services/base_service.dart';
import 'package:webapp_api/webapp_models.dart';

abstract class BaseProjectService extends BaseService<Project> {
  /// Finds a project by id.
  Future<Project?> findProject(String id);

  /// Finds many projects at once.
  Future<PaginatedIterable<Project>> findProjects({required String organizationUid, String? nextPageToken});

  /// Deletes a project by uid.
  Future<OperationStatus> deleteProject(String projectUid); 

  /// Updates a project.
  Future<OperationStatus> updateProject(String projectUid, {String? name, bool? isFavorited});

  /// Updates a project's settings
  Future<OperationStatus> updateProjectSettings(String projectUid, {required ProjectSettings projectSettings});

  /// Finds a project's usage history.
  Future<OperationStatus<ProjectUsage>> findProjectUsage(String projectUid, {Period? period});
}