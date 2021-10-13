import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:webapp/ui/controls/hyperlink.dart';

class LoginView extends StatefulWidget {

  const LoginView({Key? key }) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SelectableText("Sign In", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300)),
        const Divider(endIndent: 600),
        const SizedBox(height: 20),
        Expanded(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilderTextField(
                  name: "username",
                  decoration: const InputDecoration(
                    label: Text("Username"),
                    hintText: "Input your username"
                  ),
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  name: "password",
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                    hintText: "Input your password"
                  ),
                ),
                const SizedBox(height: 20),
                const Spacer(),
                ElevatedButton(
                  child: const Text("CONTINUE"),
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                Hyperlink(
                  text: "Don't have an account?",
                  clickableText: "Sign up here",
                  textAlign: TextAlign.center,
                  onTap: () {

                  },
                )
              ],
            )  
          ),
        )
      ],
    );
  }
}