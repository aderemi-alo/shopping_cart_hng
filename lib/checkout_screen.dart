import 'package:flutter/material.dart';
import 'package:shopping_cart_hng/bottom_nav_bar_model.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(child: Text("Order Successful!")),
        bottomNavigationBar: BottomNavBarModel(
          currentIndex: BottomNavBarModel.of(context).currentIndex,
          child: BottomNavBar(
            items: navBarItems,
            currentIndex: BottomNavBarModel.of(context).currentIndex,
            onTap: (index) => NavigatorUtil.navigateToScreen(context, index),
            selectedIconSize: 30,
          ),
        ));
  }
}
