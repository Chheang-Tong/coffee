import 'package:get/get.dart';
import '../../data/models/product.dart';
import '../cart/cart_viewmodel.dart';

class ProductDetailViewModel extends GetxController {
  late final Product product;
  final size = 'Small'.obs;
  final qty = 1.obs;
  final withoutCaffeine = false.obs;
  final whippedCream = false.obs;

  void init(Product p) {
    product = p;
    size.value = p.sizes.first;
  }

  void addToCart() {
    Get.find<CartViewModel>().addItem(
      productId: product.id,
      name: product.name,
      price: product.price,
      qty: qty.value,
      size: size.value,
    );
  }
}
