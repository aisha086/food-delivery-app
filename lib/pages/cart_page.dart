import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/widgets/cart_widgets/checkout_button.dart';
import '../services/cart_provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    Size size = MediaQuery.of(context).size;
    bool isNotEmpty = !cartProvider.items.isEmpty;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          
          Expanded(
            child:
            isNotEmpty?ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (context, index) {
                final item = cartProvider.items[index];
                return ListTile(
                  leading: Image.network(item.foodItem.imageUrl),
                  title: Text(item.foodItem.itemName),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cartProvider.removeItem(item.foodItem.itemID);
                    },
                  ),
                );
              },
            ):Icon(Icons.shopping_cart,size: 100,color: Colors.grey.withOpacity(0.6),),
          ),
          Container(
            height: size.height/6,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Theme.of(context).primaryColor,
            ),
            padding: const EdgeInsets.all(10),
            child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      " ${cartProvider.getTotalPrice()} PKR",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    CheckoutButton(totalPrice: cartProvider.getTotalPrice(),)
                  ],
                ),
          )
        ],
      ),
    );
  }
}
