import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:webapp/domain/navigation/app_router.gr.dart';
import 'package:webapp/ui/controls/hyperlink.dart';

class RegisterView extends StatefulWidget {

  const RegisterView({Key? key }) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SelectableText("Sign Up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300)),
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
                    label: Text("Email"),
                    hintText: "Type your email"
                  ),
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  name: "password",
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                    hintText: "Type your password"
                  ),
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  name: "name",
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Name"),
                    hintText: "Type your name"
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  child: const Text("CREATE AN ACCOUNT"),
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                Hyperlink(
                  text: "Already have an account?",
                  clickableText: "Sign in here",
                  textAlign: TextAlign.center,
                  onTap: () {
                    context.router.popAndPush(const LoginRoute());
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