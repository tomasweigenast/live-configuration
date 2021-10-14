// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i12;
import 'package:webapp/domain/navigation/route_guards/check_project_exists_guard.dart'
    as _i13;
import 'package:webapp/ui/views/auth/login_view.dart' as _i3;
import 'package:webapp/ui/views/auth/register_view.dart' as _i4;
import 'package:webapp/ui/views/home/project_access_view.dart' as _i11;
import 'package:webapp/ui/views/home/project_configurationentries_view.dart'
    as _i10;
import 'package:webapp/ui/views/home/project_overview_view.dart' as _i8;
import 'package:webapp/ui/views/home/project_settings_view.dart' as _i9;
import 'package:webapp/ui/views/home/project_view_wrapper.dart' as _i7;
import 'package:webapp/ui/views/home/select_project_view.dart' as _i6;
import 'package:webapp/ui/views/wrappers/dashboard_wrapper_view.dart' as _i2;
import 'package:webapp/ui/views/wrappers/unauthenticated_wrapper_view.dart'
    as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
      required this.checkProjectExistsGuard})
      : super(navigatorKey);

  final _i13.CheckProjectExistsGuard checkProjectExistsGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    UnauthenticatedRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.UnauthenticatedWrapperView());
    },
    AuthenticatedRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.DashboardWrapperView());
    },
    LoginRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.LoginView());
    },
    RegisterRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.RegisterView());
    },
    HomeViewWrapper.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.EmptyRouterPage());
    },
    SelectProjectRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.SelectProjectView());
    },
    MainProjectRouter.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<MainProjectRouterArgs>(
          orElse: () => MainProjectRouterArgs(
              projectId: pathParams.getString('projectId')));
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i7.ProjectViewWrapper(projectId: args.projectId, key: args.key));
    },
    ProjectOverviewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.ProjectOverviewView());
    },
    ProjectSettingsRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i9.ProjectSettingsView());
    },
    ProjectConfigurationEntriesRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i10.ProjectConfigurationEntriesView());
    },
    ProjectAccessRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.ProjectAccessView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(UnauthenticatedRouter.name, path: '/auth', children: [
          _i5.RouteConfig('#redirect',
              path: '', redirectTo: 'login', fullMatch: true),
          _i5.RouteConfig(LoginRoute.name, path: 'login'),
          _i5.RouteConfig(RegisterRoute.name, path: 'register'),
          _i5.RouteConfig('*#redirect',
              path: '*', redirectTo: 'login', fullMatch: true)
        ]),
        _i5.RouteConfig(AuthenticatedRouter.name, path: '/', children: [
          _i5.RouteConfig('#redirect',
              path: '', redirectTo: 'home', fullMatch: true),
          _i5.RouteConfig(HomeViewWrapper.name, path: 'home', children: [
            _i5.RouteConfig(SelectProjectRoute.name, path: ''),
            _i5.RouteConfig(MainProjectRouter.name,
                path: ':projectId',
                guards: [
                  checkProjectExistsGuard
                ],
                children: [
                  _i5.RouteConfig('#redirect',
                      path: '', redirectTo: 'overview', fullMatch: true),
                  _i5.RouteConfig(ProjectOverviewRoute.name, path: 'overview'),
                  _i5.RouteConfig(ProjectSettingsRoute.name, path: 'settings'),
                  _i5.RouteConfig(ProjectConfigurationEntriesRoute.name,
                      path: 'configuration-entries'),
                  _i5.RouteConfig(ProjectAccessRoute.name, path: 'access'),
                  _i5.RouteConfig('*#redirect',
                      path: '*', redirectTo: 'overview', fullMatch: true)
                ])
          ]),
          _i5.RouteConfig('*#redirect',
              path: '*', redirectTo: 'home', fullMatch: true)
        ])
      ];
}

/// generated route for [_i1.UnauthenticatedWrapperView]
class UnauthenticatedRouter extends _i5.PageRouteInfo<void> {
  const UnauthenticatedRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/auth', initialChildren: children);

  static const String name = 'UnauthenticatedRouter';
}

/// generated route for [_i2.DashboardWrapperView]
class AuthenticatedRouter extends _i5.PageRouteInfo<void> {
  const AuthenticatedRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'AuthenticatedRouter';
}

/// generated route for [_i3.LoginView]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: 'login');

  static const String name = 'LoginRoute';
}

/// generated route for [_i4.RegisterView]
class RegisterRoute extends _i5.PageRouteInfo<void> {
  const RegisterRoute() : super(name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for [_i5.EmptyRouterPage]
class HomeViewWrapper extends _i5.PageRouteInfo<void> {
  const HomeViewWrapper({List<_i5.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeViewWrapper';
}

/// generated route for [_i6.SelectProjectView]
class SelectProjectRoute extends _i5.PageRouteInfo<void> {
  const SelectProjectRoute() : super(name, path: '');

  static const String name = 'SelectProjectRoute';
}

/// generated route for [_i7.ProjectViewWrapper]
class MainProjectRouter extends _i5.PageRouteInfo<MainProjectRouterArgs> {
  MainProjectRouter(
      {required String projectId,
      _i12.Key? key,
      List<_i5.PageRouteInfo>? children})
      : super(name,
            path: ':projectId',
            args: MainProjectRouterArgs(projectId: projectId, key: key),
            rawPathParams: {'projectId': projectId},
            initialChildren: children);

  static const String name = 'MainProjectRouter';
}

class MainProjectRouterArgs {
  const MainProjectRouterArgs({required this.projectId, this.key});

  final String projectId;

  final _i12.Key? key;
}

/// generated route for [_i8.ProjectOverviewView]
class ProjectOverviewRoute extends _i5.PageRouteInfo<void> {
  const ProjectOverviewRoute() : super(name, path: 'overview');

  static const String name = 'ProjectOverviewRoute';
}

/// generated route for [_i9.ProjectSettingsView]
class ProjectSettingsRoute extends _i5.PageRouteInfo<void> {
  const ProjectSettingsRoute() : super(name, path: 'settings');

  static const String name = 'ProjectSettingsRoute';
}

/// generated route for [_i10.ProjectConfigurationEntriesView]
class ProjectConfigurationEntriesRoute extends _i5.PageRouteInfo<void> {
  const ProjectConfigurationEntriesRoute()
      : super(name, path: 'configuration-entries');

  static const String name = 'ProjectConfigurationEntriesRoute';
}

/// generated route for [_i11.ProjectAccessView]
class ProjectAccessRoute extends _i5.PageRouteInfo<void> {
  const ProjectAccessRoute() : super(name, path: 'access');

  static const String name = 'ProjectAccessRoute';
}
