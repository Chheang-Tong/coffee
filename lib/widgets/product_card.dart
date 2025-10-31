import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final VoidCallback? onTap;
  const ProductCard({super.key, required this.title, required this.price, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover, width: double.infinity),
                ),
              ),
              const SizedBox(height: 8),
              Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text('\$${price.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
