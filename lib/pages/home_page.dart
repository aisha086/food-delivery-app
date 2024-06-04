import 'package:flutter/material.dart';
import 'package:recipe_app/services/firebase_auth_service.dart';
import 'package:recipe_app/widgets/home_widgets/food_items_grid.dart';
import 'package:recipe_app/widgets/home_widgets/my_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => firebaseAuthService.signOut(),
                icon: const Icon(Icons.logout_outlined))
          ],
        ),
        drawer: const MyDrawer(),
        body: Column(
          children: [
            topRow(context),
            const Expanded(child: FoodGrid()),
          ],
        )
    );

  }
  topRow(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(20),
      child: Text("Today's Treat",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold
          )
      ),
    );
  }
}

