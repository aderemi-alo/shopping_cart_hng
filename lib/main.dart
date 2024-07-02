import 'package:flutter/material.dart';
import 'package:shopping_cart_hng/bottom_nav_bar_model.dart';
import 'package:shopping_cart_hng/cart.dart';
import 'cart_screen.dart';
import 'product_screen.dart';

void main() {
  runApp(
    CartModel(
      cart: Cart(),
      child: BottomNavBarModel(
        currentIndex: 0,
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ProductScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
