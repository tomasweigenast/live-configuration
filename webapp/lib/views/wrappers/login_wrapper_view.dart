import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// A wrapper that handles all routes when the user is not logged in.
class LoginWrapperView extends StatelessWidget {
  const LoginWrapperView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Configuration - Iniciar Sesión"),
      ),
      body: const AutoRouter(),
    );
  }
}