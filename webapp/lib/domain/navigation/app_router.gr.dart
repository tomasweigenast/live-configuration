// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:liveconfiguration_webapp/views/auth/login_view.dart' as _i4;
import 'package:liveconfiguration_webapp/views/home/home_view.dart' as _i3;
import 'package:liveconfiguration_webapp/views/wrappers/dashboard_wrapper_view.dart'
    as _i1;
import 'package:liveconfiguration_webapp/views/wrappers/login_wrapper_view.dart'
    as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AuthenticatedRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.DashboardWrapperView());
    },
    NotAuthenticatedRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.LoginWrapperView());
    },
    HomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.HomeView());
    },
    LoginRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () =>
              LoginRouteArgs(accountId: pathParams.getString('accountId')));
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.LoginView(accountId: args.accountId, key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(AuthenticatedRouter.name, path: '/', children: [
          _i5.RouteConfig(HomeRoute.name, path: 'home'),
          _i5.RouteConfig('*#redirect',
              path: '*', redirectTo: 'home', fullMatch: true)
        ]),
        _i5.RouteConfig(NotAuthenticatedRouter.name, path: '/auth', children: [
          _i5.RouteConfig('#redirect',
              path: '', redirectTo: 'login', fullMatch: true),
          _i5.RouteConfig(LoginRoute.name, path: 'login'),
          _i5.RouteConfig('*#redirect',
              path: '*', redirectTo: 'login', fullMatch: true)
        ])
      ];
}

/// generated route for [_i1.DashboardWrapperView]
class AuthenticatedRouter extends _i5.PageRouteInfo<void> {
  const AuthenticatedRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'AuthenticatedRouter';
}

/// generated route for [_i2.LoginWrapperView]
class NotAuthenticatedRouter extends _i5.PageRouteInfo<void> {
  const NotAuthenticatedRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/auth', initialChildren: children);

  static const String name = 'NotAuthenticatedRouter';
}

/// generated route for [_i3.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for [_i4.LoginView]
class LoginRoute extends _i5.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({required String accountId, _i6.Key? key})
      : super(name,
            path: 'login',
            args: LoginRouteArgs(accountId: accountId, key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({required this.accountId, this.key});

  final String accountId;

  final _i6.Key? key;
}
