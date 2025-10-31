import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_theme.dart';
import '../../widgets/product_card.dart';
import '../../core/routes/app_routes.dart';
import 'menu_viewmodel.dart';

class MenuView extends GetView<MenuViewModel> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MenuViewModel(Get.find()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Good morning, user'),
        actions: [
          IconButton(onPressed: () => Get.toNamed(Routes.cart), icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.error.value != null) {
                  return Center(child: Text('Error: ${controller.error.value}'));
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.74,
                  ),
                  itemCount: controller.items.length,
                  itemBuilder: (_, i) {
                    final p = controller.items[i];
                    return ProductCard(
                      title: p.name,
                      price: p.price,
                      image: p.imageUrl,
                      onTap: () => Get.toNamed(Routes.productDetail, arguments: p),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppTheme.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
