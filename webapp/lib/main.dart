import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:liveconfiguration_webapp/domain/app/app.dart';
import 'package:liveconfiguration_webapp/domain/navigation/app_router.gr.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Live Configuration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: AutoRouterDelegate.declarative(
        _appRouter,
        routes: (context) => [
          if(Application.services.accountService.isLoggedIn)
            const HomeRoute()
          else
            const NotAuthenticatedRouter()
        
        ]
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}