import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:webapp/domain/navigation/app_router.gr.dart';
import 'package:webapp/helpers/extensions.dart';
import 'package:webapp/ui/controls/hyperlink.dart';
import 'package:auto_route/auto_route.dart';
import 'package:webapp/ui/controls/loading_button.dart';

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
                  name: "email",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context)
                  ]),
                  decoration: const InputDecoration(
                    label: Text("Email"),
                    hintText: "Input your email"
                  ),
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  name: "password",
                  validator: FormBuilderValidators.required(context),
                  obscureText: true,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                    hintText: "Input your password"
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20)
                      ),
                      child: Row(
                        children: [
                          Image.asset("logos/g_logo_32.png", height: 30, width: 30, filterQuality: FilterQuality.high),
                          const SizedBox(width: 24),
                          const Text("Continue with Google", style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFFA19E95)))
                        ],
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 5,
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20)
                      ),
                      child: Row(
                        children: [
                          Image.asset("logos/github_dark_32.png", height: 30, width: 30, filterQuality: FilterQuality.high),
                          const SizedBox(width: 24),
                          const Text("Continue with GitHub", style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFFA19E95)))
                        ],
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                const Spacer(),
                LoadingButton.elevated(
                  child: const Text("CONTINUE"),
                  hideChildOnLoading: true,
                  onPressed: () async {
                    if(_formKey.currentState!.saveAndValidate()) {
                      String? email = _formKey.getFieldOrNull<String>("email");
                      String? password = _formKey.getFieldOrNull<String>("password");
                    }
                  },
                ),
                const SizedBox(height: 10),
                Hyperlink(
                  text: "Don't have an account?",
                  clickableText: "Sign up here",
                  textAlign: TextAlign.center,
                  onTap: () {
                    context.router.popAndPush(const RegisterRoute());
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