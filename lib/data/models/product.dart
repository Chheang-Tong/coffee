class Product {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String description;
  final List<String> sizes;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.sizes,
  });
}
