import 'package:flutter/material.dart';
import 'package:shopping_cart_hng/bottom_nav_bar_model.dart';
import 'package:shopping_cart_hng/checkout_screen.dart';
import 'cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = CartModel.of(context).cart;
    if (cart.cartItems.isNotEmpty) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cart.cartItems.length,
                  itemBuilder: (itemBuilder, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Material(
                        elevation: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cart.cartItems[index].product.productName,
                                  ),
                                  Text(cart
                                      .cartItems[index].product.productPrice)
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    cart.cartItems[index].quantity.toString(),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cart.removeProduct(
                                            cart.cartItems[index].product);
                                      });
                                    },
                                    icon: Icon(Icons.remove_circle_outline),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Text('Total Price: ₦ ${cart.totalPrice.toInt()}'),
            TextButton(
                onPressed: () {
                  setState(() {
                    cart.checkout();
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutScreen()));
                },
                child: const Text("Checkout"))
          ],
        ),
        bottomNavigationBar: BottomNavBarModel(
          currentIndex: BottomNavBarModel.of(context).currentIndex,
          child: BottomNavBar(
            items: navBarItems, // Use the centralized list
            currentIndex: BottomNavBarModel.of(context).currentIndex,
            onTap: (index) => NavigatorUtil.navigateToScreen(context, index),
            iconSize: 24.0,
            selectedIconSize: 30,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text("Your cart is empty,, please add a product"),
        ),
        bottomNavigationBar: BottomNavBarModel(
          currentIndex: BottomNavBarModel.of(context).currentIndex,
          child: BottomNavBar(
            items: navBarItems,
            currentIndex: BottomNavBarModel.of(context).currentIndex,
            onTap: (index) => NavigatorUtil.navigateToScreen(context, index),
            selectedIconSize: 30,
          ),
        ),
      );
    }
  }
}
