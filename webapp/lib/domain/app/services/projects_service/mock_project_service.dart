import 'package:webapp/domain/app/services/projects_service/base_project_service.dart';
import 'package:webapp/domain/models/project.dart';

class MockProjectService extends BaseProjectService {
  @override
  Future<Project?> findProject(String id) async {
    // await Future.delayed(const Duration(seconds: 5));
    
    if(id == "123456789") {
      return Project(id: "123456789", name: "An Amazing Project!");
    }

    return null;
  }

}