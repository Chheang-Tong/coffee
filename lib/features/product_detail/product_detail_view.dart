import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_button.dart';
import 'product_detail_viewmodel.dart';
import '../../data/models/product.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final Product p = Get.arguments as Product;
    final vm = Get.put(ProductDetailViewModel())..init(p);
    return Scaffold(
      appBar: AppBar(title: Text(p.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 16/9,
                child: CachedNetworkImage(imageUrl: p.imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 12),
            Text(p.description),
            const SizedBox(height: 12),
            const Text('Size'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: p.sizes.map((s) => Obx(() => ChoiceChip(
                label: Text(s),
                selected: vm.size.value == s,
                onSelected: (_) => vm.size.value = s,
              ))).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(onPressed: () => vm.qty.value = (vm.qty.value - 1).clamp(1, 99), icon: const Icon(Icons.remove_circle_outline)),
                Obx(() => Text(vm.qty.value.toString(), style: const TextStyle(fontSize: 18))),
                IconButton(onPressed: () => vm.qty.value++, icon: const Icon(Icons.add_circle_outline)),
                const Spacer(),
                Obx(() => Text('\$${(p.price * vm.qty.value).toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() => SwitchListTile(
              value: vm.whippedCream.value,
              onChanged: (v) => vm.whippedCream.value = v,
              title: const Text('Whipped cream'),
            )),
            Obx(() => SwitchListTile(
              value: vm.withoutCaffeine.value,
              onChanged: (v) => vm.withoutCaffeine.value = v,
              title: const Text('Without caffeine'),
            )),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: AppButton(text: 'Add to Cart', onPressed: vm.addToCart),
      ),
    );
  }
}
