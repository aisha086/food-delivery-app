import 'package:flutter/material.dart';

import '../../pages/check_out.dart';
class CheckoutButton extends StatefulWidget {
  const CheckoutButton({super.key, required this.totalPrice});

  final double totalPrice;
  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  get cartProvider => null;



  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutPage(orderPrice: widget.totalPrice),
            ),
          );
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
            minimumSize: MaterialStateProperty.all(
                Size(size.width/2.5, 50)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
        child: const Text(
          "Checkout",
              style: TextStyle(
            color: Colors.white
        ),
        ),
      ),
    );
  }

}

