import 'package:webapp/domain/app/services/base_service.dart';
import 'package:webapp/domain/models/project.dart';

abstract class BaseProjectService extends BaseService<Project> {
  Future<Project?> findProject(String id);
}