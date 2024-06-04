import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/food_item.dart';
import 'package:recipe_app/widgets/common_widgets/notifs.dart';

import '../../models/cart_item.dart';
import '../../services/cart_provider.dart';
class AddToCartButton extends StatefulWidget {
  const AddToCartButton({super.key, required this.currItem, required this.quantityCount});
  final FoodItem currItem;
  final int quantityCount;

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool _isAdded = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () async {
          if (!_isAdded && widget.quantityCount > 0) {
            final cartItem = CartItem(foodItem: widget.currItem, quantity: widget.quantityCount);
            Provider.of<CartProvider>(context, listen: false).addItem(cartItem);
            setState(() {
              _isAdded = true;
            });
          }
          else{
            String addedToastText = "Item has been Added!";
            String countText = "Increase the quantity!";
            if(_isAdded){
             showToast(addedToastText);
            }
            else if(widget.quantityCount == 0){
              showToast(countText);
            }
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.6)),
            minimumSize: MaterialStateProperty.all(
                const Size(double.infinity, 50)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)))),
        child: Icon(
          _isAdded? Icons.check : Icons.add_shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }

}

