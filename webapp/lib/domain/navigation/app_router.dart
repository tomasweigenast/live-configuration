import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:webapp/domain/navigation/route_guards/check_project_exists_guard.dart';
import 'package:webapp/ui/views/auth/login_view.dart';
import 'package:webapp/ui/views/auth/register_view.dart';
import 'package:webapp/ui/views/home/project_access_view.dart';
import 'package:webapp/ui/views/home/project_configurationentries_view.dart';
import 'package:webapp/ui/views/home/project_overview_view.dart';
import 'package:webapp/ui/views/home/project_settings_view.dart';
import 'package:webapp/ui/views/home/project_view_wrapper.dart';
import 'package:webapp/ui/views/home/select_project_view.dart';
import 'package:webapp/ui/views/wrappers/dashboard_wrapper_view.dart';
import 'package:webapp/ui/views/wrappers/unauthenticated_wrapper_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AutoRoute(
      path: '/auth',
      name: "UnauthenticatedRouter",
      page: UnauthenticatedWrapperView,
      children: [
        AutoRoute(path: 'login', page: LoginView, initial: true),
        AutoRoute(path: 'register', page: RegisterView),
        RedirectRoute(path: '*', redirectTo: 'login')
      ]
    ),
    AutoRoute(
      path: '/',
      name: "AuthenticatedRouter",
      page: DashboardWrapperView,
      children: [
        AutoRoute(
          path: 'home', 
          page: EmptyRouterPage,
          name: "HomeViewWrapper",
          children: [
            AutoRoute(path: "", page: SelectProjectView, initial: true),
            AutoRoute(
              path: ":projectId", 
              page: ProjectViewWrapper,
              name: "MainProjectRouter",
              guards: [CheckProjectExistsGuard],
              children: [
                AutoRoute(path: "overview", page: ProjectOverviewView, initial: true),
                AutoRoute(path: "settings", page: ProjectSettingsView),
                AutoRoute(path: "configuration-entries", page: ProjectConfigurationEntriesView),
                AutoRoute(path: "access", page: ProjectAccessView),
                RedirectRoute(path: "*", redirectTo: "overview")
              ]
            )
          ], 
          initial: true
        ),
        RedirectRoute(path: '*', redirectTo: 'home')
      ]
    ),
  ]
)
class $AppRouter {}