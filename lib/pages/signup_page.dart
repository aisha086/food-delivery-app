import 'package:flutter/material.dart';
import 'package:recipe_app/models/customer.dart';
import 'package:recipe_app/services/api_service.dart';
import 'package:recipe_app/services/firebase_auth_service.dart';
import 'package:recipe_app/widgets/auth_widgets/auth_button.dart';
import 'package:recipe_app/widgets/auth_widgets/credentials_field.dart';
import 'package:recipe_app/widgets/common_widgets/notifs.dart';

import '../services/theme_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();

}

class _SignUpPageState extends State<SignUpPage> {
  final List<String> pkStates = [
    'Select State',
    'KPK',
    'Punjab',
    'Sindh',
    'Balochistan',
    'Gilgit Baltistan',
    'Islamabad Capital Territory',
    'Azad Kashmir'
  ];

  bool isSigning = false;
  bool isGoogleSigning = false;
  ApiService apiService = ApiService();
  FirebaseAuthService authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String selectedState = '';
  @override
  void initState() {

    super.initState();
    selectedState = pkStates.first;
    print("selected state in init : $selectedState");
  }
  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
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
                        labelText: "Name",
                        controller: _nameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CredentialsForm(
                        isPassword: false,
                        labelText: "Email",
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildStateDropDown(),
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
                      CredentialsForm(
                        isPassword: true,
                        labelText: "Confirm Password",
                        controller: _confirmPasswordController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AuthButton(
                        text: "Sign Up",
                        onPressed: _signUp,
                        isSigning: isSigning,
                      ),
                      // TODO: Make the google sign in work with customer database
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
                          const Text("Already have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Log In"))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      isSigning = true;
    });
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String state = selectedState;

    if (password == _confirmPasswordController.text) {
      await apiService.postCustomers(Customer(cName: name, cEmail: email, cState: state));
      await authService.signUpWithEmailAndPassword(email, password);
      Navigator.pop(context);
    } else {
      showToast("Passwords don't match!");
      setState(() {
        isSigning = false;
      });
    }
  }

  buildStateDropDown() {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration(
          labelText: 'Your State',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      value: selectedState.isEmpty?null:selectedState,
      items: pkStates.map((state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Text(state),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedState = value!;
        });
      },
    );
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
            "Sign Up",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: MyTheme.lightCanvasColor,
            ),
          ),
          Text(
            "Unlock a world of delicious inspiration",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              color: MyTheme.lightCanvasColor,
            ),
          )
        ],
      ),
    ),
  );
}
