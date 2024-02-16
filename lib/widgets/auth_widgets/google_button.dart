import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app/services/firebase_auth_service.dart';
import 'package:recipe_app/services/theme_service.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({super.key, required this.isSigning});

  final FirebaseAuthService authService = FirebaseAuthService();

  final bool isSigning;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.lightIconColor),
            fixedSize:
                MaterialStateProperty.all( Size(size.width/2, 50)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)))),
        onPressed: () => authService.signInWithGoogle(),
        child: isSigning
            ? const CircularProgressIndicator()
            : const Row(
          mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Continue with ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(FontAwesomeIcons.google)
                ],
              ));
  }
}
