import 'package:flutter/material.dart';
import 'package:recipe_app/services/firebase_auth_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () =>firebaseAuthService.signOut(), icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: const Center(
        child: Text(
          "Logged In"
        ),
      ),
    );
  }
}
