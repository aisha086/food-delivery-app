
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/services/api_service.dart';
import 'package:recipe_app/services/persistent_current_customer.dart';

import '../models/customer.dart';
import '../models/order.dart';
import '../services/cart_provider.dart';

class CheckoutPage extends StatefulWidget {
  final double orderPrice;

  const CheckoutPage({super.key, required this.orderPrice});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();

}

class _CheckoutPageState extends State<CheckoutPage> {
  ApiService apiService = ApiService();
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _submitOrder() async {
    Customer currCustomer = await getCustomer();
    int customerId = currCustomer.cID!;
    String orderAddress = _addressController.text.trim();

    Order order = Order(
      customerId: customerId,
      orderAddress: orderAddress,
      orderPrice: widget.orderPrice,
    );

    apiService.postOrder(order);

  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Place Your Order')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Enter your delivery address'),
              keyboardType: TextInputType.streetAddress,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: (){
                _submitOrder();
                cartProvider.emptyCart();
                Navigator.pop(context);
              },
              child: const Text('Submit',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
