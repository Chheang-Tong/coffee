import 'dart:async';
import '../../core/network/dio_client.dart';
import '../models/product.dart';

class ProductRepository {
  final DioClient _client;
  ProductRepository(this._client);

  Future<List<Product>> fetchMenu() async {
    // Simulate network latency
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      Product(
        id: 1,
        name: 'Caramel Macchiato',
        imageUrl: 'https://images.unsplash.com/photo-1512568400610-62da28bc8a13?w=640',
        price: 4.00,
        description: 'Espresso with vanilla syrup, milk, and caramel drizzle.',
        sizes: ['Small', 'Medium', 'Large'],
      ),
      Product(
        id: 2,
        name: 'Caffè Mocha',
        imageUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=640',
        price: 3.70,
        description: 'Chocolate-flavored warm coffee drink.',
        sizes: ['Small', 'Medium', 'Large'],
      ),
      Product(
        id: 3,
        name: 'Traditional Cappuccino',
        imageUrl: 'https://images.unsplash.com/photo-1529070538774-1843cb3265df?w=640',
        price: 3.50,
        description: 'Equal parts espresso, steamed milk, and foam.',
        sizes: ['Small', 'Medium', 'Large'],
      ),
    ];
  }

  Future<Product> getProduct(int id) async {
    final all = await fetchMenu();
    return all.firstWhere((p) => p.id == id);
  }
}
