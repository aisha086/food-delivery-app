import 'package:http/http.dart' as http;
import 'package:recipe_app/models/food_item.dart';
import 'package:recipe_app/models/order.dart';
import 'package:recipe_app/widgets/common_widgets/notifs.dart';
import 'dart:convert';

import '../models/customer.dart';

class ApiService {
  fetchItems() async {
    final response = await http
        .get(Uri.parse('http://192.168.1.6/flutter-php/api/fetch_product.php'));
    print(response.statusCode);
    try {
      var jsonData = json.decode(response.body);
      print(jsonData);
      // Check if the success field is true
      if (jsonData['success']) {
        var itemData = jsonData['products'] as List<dynamic>;
        List<FoodItem> foodItems =
        itemData.map((e) => FoodItem.fromJson(e)).toList();
        print("this is json data");
        print(itemData);
        return foodItems;
      } else {
        return Future.error("Error: ${jsonData['message']}");
      }
    } catch (e) {
      return Future.error("Error parsing data: $e");
    }
  }

  postCustomers(Customer customer) async {
    final response = await http.post(
        Uri.parse('http://192.168.1.6/flutter-php/api/post_customer.php'),
        body: customer.toJson());
    print(response.statusCode);

    // Check if the success field is true
    if (response.statusCode == 200) {
      // Request was successful, you can handle the response here.
      print('Response: ${response.body}');
    } else {
      // Request failed, handle the error.
      print('Error: ${response.reasonPhrase}');
    }
  }

  getCustomer(String email) async {
    final response = await http
        .get(Uri.parse('http://192.168.1.6/flutter-php/api/get_customer.php?email=$email'));
    print(response.statusCode);
    try {
      var jsonData = json.decode(response.body);
      print(jsonData);
      // Check if the success field is true
      if (jsonData['success']) {

        print("this is json data");
        Customer customer = Customer.fromJson(jsonData['customer']);
        return customer;
      } else {
        return Future.error("Error: ${jsonData['message']}");
      }
    } catch (e) {
      return Future.error("Error parsing data: $e");
    }
  }

  postOrder(Order order) async {
    final response = await http.post(
        Uri.parse('http://192.168.1.6/flutter-php/api/post_orders.php'),
        body: order.toJson());
    print(response.statusCode);

    // Check if the success field is true
    if (response.statusCode == 200) {
      // Request was successful, you can handle the response here.
      print('Response: ${response.body}');
      showToast("Order Submitted");
    } else {
      // Request failed, handle the error.
      print('Error: ${response.reasonPhrase}');
      showToast("Order Failed");

    }
  }

  getOrder(int id) async {
    final response = await http
        .get(Uri.parse('http://192.168.1.6/flutter-php/api/get_orders.php?id=$id'));
    print(response.statusCode);
    try {
      var jsonData = json.decode(response.body);
      print(jsonData);
      // Check if the success field is true
      if (jsonData['success']) {

        var orderData = jsonData['orders'] as List<dynamic>;
        List<Order> orders =
        orderData.map((e) => Order.fromJson(e)).toList();
        print("this is json data");
        print(orderData);
        return orders;
      } else {
        return Future.error("Error: ${jsonData['message']}");
      }
    } catch (e) {
      return Future.error("Error parsing data: $e");
    }
  }
}
