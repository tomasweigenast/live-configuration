import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:webapp/ui/views/auth/login_view.dart';
import 'package:webapp/ui/views/home/home_view.dart';
import 'package:webapp/ui/views/wrappers/dashboard_wrapper_view.dart';
import 'package:webapp/ui/views/wrappers/unauthenticated_wrapper_view.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      initial: true,
      name: "AuthenticatedRouter",
      page: DashboardWrapperView,
      children: [
        AutoRoute(path: 'home', page: HomeView),
        RedirectRoute(path: '*', redirectTo: 'home')
      ]
    ),
    AutoRoute(
      path: '/auth',
      name: "UnauthenticatedRouter",
      page: UnauthenticatedWrapperView,
      children: [
        AutoRoute(path: 'login', page: LoginView, initial: true),
        RedirectRoute(path: '*', redirectTo: 'login')
      ]
    ),
  ]
)
class $AppRouter {}