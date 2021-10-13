// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:webapp/ui/views/auth/login_view.dart' as _i4;
import 'package:webapp/ui/views/home/home_view.dart' as _i3;
import 'package:webapp/ui/views/wrappers/dashboard_wrapper_view.dart' as _i1;
import 'package:webapp/ui/views/wrappers/unauthenticated_wrapper_view.dart'
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
    UnauthenticatedRouter.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.UnauthenticatedWrapperView());
    },
    HomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.HomeView());
    },
    LoginRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.LoginView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(AuthenticatedRouter.name, path: '/', children: [
          _i5.RouteConfig(HomeRoute.name, path: 'home'),
          _i5.RouteConfig('*#redirect',
              path: '*', redirectTo: 'home', fullMatch: true)
        ]),
        _i5.RouteConfig(UnauthenticatedRouter.name, path: '/auth', children: [
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

/// generated route for [_i2.UnauthenticatedWrapperView]
class UnauthenticatedRouter extends _i5.PageRouteInfo<void> {
  const UnauthenticatedRouter({List<_i5.PageRouteInfo>? children})
      : super(name, path: '/auth', initialChildren: children);

  static const String name = 'UnauthenticatedRouter';
}

/// generated route for [_i3.HomeView]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for [_i4.LoginView]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: 'login');

  static const String name = 'LoginRoute';
}
