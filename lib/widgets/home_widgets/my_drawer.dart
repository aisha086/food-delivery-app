

import 'package:flutter/material.dart';
import 'package:recipe_app/models/customer.dart';
import 'package:recipe_app/services/persistent_current_customer.dart';

import '../../pages/cart_page.dart';
import '../../pages/home_page.dart';
import '../../pages/orders_page.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  Customer currCustomer = Customer(cName: '', cEmail: '', cState: '');

  @override
  void initState() {
    super.initState();
    getCustomer();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            accountName: Text(currCustomer.cName),
            accountEmail: Text(currCustomer.cEmail),
            currentAccountPicture: const Icon(
              Icons.person,
              size: 35,
            ),
          ),
          drawerTile(Icons.home, "Home", context),
          drawerTile(Icons.shopping_cart, "Cart", context),
          drawerTile(Icons.my_library_books_rounded, "Orders", context),
        ],
      ),
    );
  }

  drawerTile(IconData drawerIcon, String drawerText, BuildContext context) {
    return ListTile(
      leading: Icon(
        drawerIcon,
      ),
      title: Text(
        drawerText,
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          switch (drawerText) {
            case "Home":
              {
                return HomePage();
              }
            case "Cart":
              {
                return const CartPage();
              }
            case "Orders":
              {
                return OrdersPage(customerId: currCustomer.cID!,);
              }
          }
          return HomePage();
        }));
      },
    );
  }

  getCustomer() async{
    print("getting customers");
    currCustomer = await getCustomerData();
    print(currCustomer.cEmail);
    setState(() {});
    print(currCustomer.cEmail);
  }
}
