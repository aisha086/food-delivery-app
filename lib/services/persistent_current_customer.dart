import 'dart:convert';

import 'package:recipe_app/models/customer.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeCustomerData(String customerJson) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("customer_data", customerJson);
}

Future<Customer> getCustomerData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? customer = prefs.getString("customer_data");
  var customerJson = jsonDecode(customer!);
  if (customerJson != null) {
    print(customer);
    print("returning customer ${Customer.fromJson(customerJson)},${Customer.fromJson(customerJson).cEmail}");
    return Customer.fromJson(customerJson);
  } else {
    throw Exception('No customer data found');
  }
}
