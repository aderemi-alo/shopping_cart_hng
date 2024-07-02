import 'package:flutter/material.dart';
import 'package:shopping_cart_hng/cart_screen.dart';
import 'package:shopping_cart_hng/product_screen.dart';

class BottomNavBarModel extends InheritedWidget {
  final int currentIndex;

  const BottomNavBarModel({
    super.key,
    required this.currentIndex,
    required super.child,
  });

  static BottomNavBarModel of(BuildContext context) {
    final BottomNavBarModel? ancestor =
        context.dependOnInheritedWidgetOfExactType<BottomNavBarModel>();
    return ancestor!;
  }

  @override
  bool updateShouldNotify(BottomNavBarModel oldWidget) {
    return currentIndex != oldWidget.currentIndex;
  }
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final void Function(int index) onTap;
  final Color unselectedIconColor;
  final Color selectedIconColor;
  final double iconSize;
  final double selectedIconSize;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
    this.unselectedIconColor = Colors.grey,
    this.selectedIconColor = Colors.blue,
    this.iconSize = 24.0,
    this.selectedIconSize = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items.asMap().entries.map((entry) {
        final int index = entry.key;
        final BottomNavigationBarItem item = entry.value;
        return BottomNavigationBarItem(
          icon: item.icon,
          label: item.label,
        );
      }).toList(),
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

const List<BottomNavigationBarItem> navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_bag),
    label: 'Products',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Cart',
  ),
];

class NavigatorUtil {
  static navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CartScreen()));
        break;
      default:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductScreen()));
    }
  }
}
