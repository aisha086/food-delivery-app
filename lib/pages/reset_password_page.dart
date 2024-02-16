import 'package:flutter/material.dart';
import 'package:recipe_app/services/firebase_auth_service.dart';
import 'package:recipe_app/services/theme_service.dart';
import 'package:recipe_app/widgets/auth_widgets/auth_button.dart';
import 'package:recipe_app/widgets/auth_widgets/credentials_field.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool isSigning = false;
  FirebaseAuthService authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            height: size.height/5,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Text(
              "Reset Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40,
                color: MyTheme.lightCanvasColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding:
              const EdgeInsets.only(left: 20, right: 20,top: 80),
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(50))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail_lock_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 100,
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
                    AuthButton(
                      text: "Reset Password",
                      onPressed: resetPass,
                      isSigning: isSigning,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  resetPass() async{
    setState(() {
      isSigning = true;
    });
    String email = _emailController.text;

    bool resetLink = await authService.resetPassword(email);

    if(resetLink){
      Navigator.pop(context);
    }
    else{
      setState(() {
        isSigning = false;
      });
    }
  }
}
