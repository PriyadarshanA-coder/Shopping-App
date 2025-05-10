import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String imagePath;

  Product({required this.name, required this.price, required this.imagePath});
  String get formattedPrice => '\$$price';
}

class Shop extends ChangeNotifier {
  // List of products in the cart
  final List<Product> _cart = [];

  // Getter for cart items
  List<Product> get cart => _cart;

  // Add to cart
  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners(); // Update UI
  }

  // Remove from cart
  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners(); // Update UI
  }
}
