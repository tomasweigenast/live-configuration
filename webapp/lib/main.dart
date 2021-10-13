import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:webapp/domain/app/app.dart';
import 'package:webapp/helpers/constants.dart';

import 'domain/navigation/app_router.gr.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        disabledColor: Colors.grey[700],
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            textStyle: const TextStyle(
              fontSize: 20
            ),
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            textStyle: const TextStyle(
              fontSize: 20
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            textStyle: const TextStyle(
              fontSize: 20
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          alignLabelWithHint: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero
          )
        ),
        colorScheme: ColorScheme(
          primary: kPrimaryColor,
          primaryVariant: kPrimaryDarkColor,
          onPrimary: Colors.white,
          secondary: kSecondaryColor,
          secondaryVariant: kSecondaryDarkColor,
          onSecondary: Theme.of(context).colorScheme.onSecondary,
          background: Theme.of(context).colorScheme.background,
          onError: kErrorColor,
          onSurface: Theme.of(context).colorScheme.onSurface,
          surface: Theme.of(context).colorScheme.surface,
          brightness: Theme.of(context).colorScheme.brightness,
          error: Theme.of(context).colorScheme.error,
          onBackground: Theme.of(context).colorScheme.onBackground,
        ),
        cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero
          )
        )
      ),
      routerDelegate: AutoRouterDelegate.declarative(
        _appRouter,
        routes: (context) => [
          if(Application.services.accountService.isLoggedIn)
            const HomeRoute()
          else
            const UnauthenticatedRouter()
        ]
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}