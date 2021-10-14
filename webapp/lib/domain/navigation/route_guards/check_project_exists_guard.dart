import 'package:auto_route/auto_route.dart';
import 'package:webapp/domain/app/services/projects_service/base_project_service.dart';
import 'package:webapp/domain/app/services/projects_service/mock_project_service.dart';
import 'package:webapp/domain/navigation/app_router.gr.dart';

class CheckProjectExistsGuard extends AutoRouteGuard {

  late final BaseProjectService _projectService = MockProjectService();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final projectId = resolver.route.pathParams.get("projectId") as String?;
    if(projectId == null) {
      router.replace(const SelectProjectRoute());
    }

    // router.push(route)
    resolver.next(true);

    // _projectService.findProject(projectId!).then((project) {
    //   if(project == null) {
    //     router.replace(const SelectProjectRoute());
    //   } else {
        
    //   }
    // });
  }

}