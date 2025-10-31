import 'package:get/get.dart';

class CartItem {
  final int productId;
  final String name;
  final double price;
  final int qty;
  final String size;

  CartItem({required this.productId, required this.name, required this.price, required this.qty, required this.size});

  double get lineTotal => price * qty;

  CartItem copyWith({int? qty}) => CartItem(productId: productId, name: name, price: price, qty: qty ?? this.qty, size: size);
}

class CartViewModel extends GetxController {
  final items = <CartItem>[].obs;

  void addItem({required int productId, required String name, required double price, required int qty, required String size}) {
    final idx = items.indexWhere((e) => e.productId == productId && e.size == size);
    if (idx >= 0) {
      final cur = items[idx];
      items[idx] = cur.copyWith(qty: cur.qty + qty);
    } else {
      items.add(CartItem(productId: productId, name: name, price: price, qty: qty, size: size));
    }
  }

  void removeAt(int i) => items.removeAt(i);

  double get subtotal => items.fold(0, (p, e) => p + e.lineTotal);
  double get discount => 0;
  double get total => subtotal - discount;
}
