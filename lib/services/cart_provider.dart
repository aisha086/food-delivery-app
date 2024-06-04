import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  CartProvider() {
    _loadCart();
  }

  void _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cart') ?? '[]';
    final List<dynamic> decodedData = json.decode(cartData);
    _items = decodedData.map((item) => CartItem.fromJson(item)).toList();
    notifyListeners();
  }

  void _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = json.encode(_items.map((item) => item.toJson()).toList());
    prefs.setString('cart', cartData);
  }

  void addItem(CartItem cartItem) {

    final index = _items.indexWhere((item) => item.foodItem.itemID == cartItem.foodItem.itemID);
    if (index >= 0) {
      _items[index].quantity += cartItem.quantity;
    } else {
      _items.add(cartItem);
    }
    _saveCart();
    notifyListeners();
  }
  // Inside CartProvider class

  double getTotalPrice() {
    double total = 0;
    for (var item in _items) {
      total += item.foodItem.price * item.quantity;
    }
    return total;
  }

  void removeItem(int itemID) {

    _items.removeWhere((item) => item.foodItem.itemID == itemID);
    _saveCart();
    notifyListeners();
  }

  void emptyCart() async {
    _items.clear(); // Clear the items list
    _saveCart(); // Save the changes to shared preferences
    notifyListeners(); // Notify listeners about the change
  }

}
