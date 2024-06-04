import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/pages/reset_password_page.dart';
import 'package:recipe_app/pages/signup_page.dart';
import 'package:recipe_app/services/api_service.dart';
import 'package:recipe_app/services/firebase_auth_service.dart';
import 'package:recipe_app/services/theme_service.dart';
import 'package:recipe_app/widgets/auth_widgets/auth_button.dart';
import 'package:recipe_app/widgets/auth_widgets/credentials_field.dart';

import '../models/customer.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  FirebaseAuthService authService = FirebaseAuthService();
  ApiService apiService = ApiService();
  bool isSigning = false;
  bool isGoogleSigning = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitleSection(context),
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CredentialsForm(
                      isPassword: false,
                      labelText: "Email",
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CredentialsForm(
                      isPassword: true,
                      labelText: "Password",
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetPasswordPage()));
                            },
                            child: const Text("Forgot Password"))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AuthButton(
                      text: "Log In",
                      onPressed: _signIn,
                      isSigning: isSigning,
                    ),
                    // Todo: make the google sign in work with customer database
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // const Text("OR"),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // GoogleButton(isSigning: isGoogleSigning),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPage()));
                            },
                            child: const Text("Sign Up"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signIn() async {
    setState(() {
      isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    Customer currentCustomer = await apiService.getCustomer(email);
    print(currentCustomer.cID);
    if (currentCustomer.cID != null) {
      await authService.signInWithEmailAndPassword(
          email, password, jsonEncode(currentCustomer.toJsonALL()));
    }

    setState(() {
      isSigning = false;
    });
  }
}

Widget buildTitleSection(BuildContext context) {
  return Expanded(
    flex: 2,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Login",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: MyTheme.lightCanvasColor,
            ),
          ),
          Text(
            "Lets get cooking!",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 26,
              color: MyTheme.lightCanvasColor,
            ),
          )
        ],
      ),
    ),
  );
}
