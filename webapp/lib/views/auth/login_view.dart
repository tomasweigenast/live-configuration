import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  final String accountId;

  const LoginView({@PathParam("accountId") required this.accountId, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}