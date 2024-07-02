import 'package:flutter/material.dart';
import 'package:shopping_cart_hng/product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);
  void addToCart() {
    quantity++;
  }

  void removeFromCart() {
    quantity--;
  }
}

class Cart {
  final List<CartItem> cartItems = [];
  double totalPrice = 0;

  void addProduct(Product product) {
    final item = cartItems.firstWhere(
      (item) => item.product == product,
      orElse: () => CartItem(product, 0),
    );
    if (item.quantity > 0) {
      item.addToCart();
    } else {
      cartItems.add(CartItem(product, 1));
    }
    calculateTotalPrice();
  }

  void removeProduct(Product product) {
    final item = cartItems.firstWhere((item) => item.product == product);
    if (item.quantity > 1) {
      item.removeFromCart();
    } else {
      cartItems.remove(item);
    }
    calculateTotalPrice();
  }

  void checkout() async {
    cartItems.clear();
  }

  double calculateTotalPrice() {
    for (var item in cartItems) {
      totalPrice +=
          double.parse(item.product.productPrice.substring(1)) * item.quantity;
    }
    return totalPrice;
  }
}

class CartModel extends InheritedWidget {
  final Cart cart;

  const CartModel({
    super.key,
    required this.cart,
    required super.child,
  });

  @override
  bool updateShouldNotify(CartModel oldWidget) {
    return cart != oldWidget.cart;
  }

  static CartModel of(BuildContext context) {
    final CartModel? ancestor =
        context.dependOnInheritedWidgetOfExactType<CartModel>();
    return ancestor!;
  }
}
