import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/product/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
      ),
      title: Text(product.title),
      subtitle: Text('\$${product.price}'),
      onTap: onTap,
    );
  }
}
