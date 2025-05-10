import 'package:demo/product.dart';
import 'package:flutter/material.dart';

void addToCart(BuildContext context, Product product) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          content: Text("Add ${product.name} to your cart?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Add to cart logic here
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Added to cart!")));
              },
              child: Text("Add"),
            ),
          ],
        ),
  );
}
