import 'package:flutter/material.dart';
import 'package:recipe_app/services/api_service.dart';

import '../models/order.dart';
class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key, required this.customerId});
  final int customerId;

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  ApiService apiService = ApiService();
  List<Order> orders = [];
  @override
  void initState() {
    super.initState();
    getOrders();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Page"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Order #${index + 1}'),
            subtitle: Text('Address: ${orders[index].orderAddress}'),
            trailing: Text('Status: ${orders[index].orderStatus}'),
          );
        },
      )
    );
  }
  getOrders() async {
    orders = await apiService.getOrder(widget.customerId);
    setState(() {});
  }
}
