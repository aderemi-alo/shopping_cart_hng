import 'package:flutter/material.dart';
import 'package:shopping_cart_hng/bottom_nav_bar_model.dart';
import 'product.dart';
import 'cart.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Product> _productList = [
    Product(
      'Noise-Cancelling Headphones',
      'images/headphones.jpg',
      '₦35000',
      'Block out descriptions and enjoy immersive audio.',
    ),
    Product(
      'Smartwatch',
      'images/smartwatch.jpg',
      '₦50000',
      'Tracks fitness, receives notifications, and controls music',
    ),
    Product(
      'Power Bank',
      'images/powerbank.png',
      '₦7500',
      'Provides on-the-go power for your devices',
    ),
    Product(
      'Wireless Earbuds',
      'images/earbuds.png',
      '₦10000',
      'Enjoy crystal-clear audio without wires',
    ),
    Product(
      'Wireless Charging Pad',
      'images/charger.png',
      '₦5000',
      'Charge your devices wirelessly',
    ),
    Product(
      'Water Bottle',
      'images/bottle.png',
      '₦2500',
      'Stay hydrated in style',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = CartModel.of(context).cart;
    return Scaffold(
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (itemBuilder, int i) {
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: Material(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                width: 100,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_productList[i].productName),
                    Image.asset(
                      _productList[i].productImage,
                      width: 150,
                      height: 150,
                    ),
                    Text(_productList[i].productPrice),
                    TextButton(
                      onPressed: () => cart.addProduct(_productList[i]),
                      child: Text("Add to cart"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBarModel(
        currentIndex: BottomNavBarModel.of(context).currentIndex,
        child: BottomNavBar(
          items: navBarItems,
          currentIndex: BottomNavBarModel.of(context).currentIndex,
          onTap: (index) => NavigatorUtil.navigateToScreen(context, index),
          unselectedIconColor: Colors.grey,
          selectedIconColor: Colors.blue,
          iconSize: 24.0,
          selectedIconSize: 30,
        ),
      ),
    );
  }
}
