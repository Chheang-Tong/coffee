import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_button.dart';
import 'cart_viewmodel.dart';

class CartView extends GetView<CartViewModel> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartViewModel());
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Obx(() {
        if (controller.items.isEmpty) {
          return const Center(child: Text('Your cart is empty'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (_, i) {
            final it = controller.items[i];
            return ListTile(
              title: Text('${it.name} • ${it.size}'),
              subtitle: Text('\$${it.price.toStringAsFixed(2)} × ${it.qty}'),
              trailing: Text('\$${it.lineTotal.toStringAsFixed(2)}'),
              onLongPress: () => controller.removeAt(i),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
          itemCount: controller.items.length,
        );
      }),
      bottomNavigationBar: Obx(() => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Subtotal'), Text('\$${controller.subtotal.toStringAsFixed(2)}'),
            ]),
            const SizedBox(height: 4),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
              Text('Discount'), Text('\$0.00'),
            ]),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$${controller.total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 12),
            AppButton(text: 'Check Out', onPressed: () {}),
          ],
        ),
      )),
    );
  }
}
