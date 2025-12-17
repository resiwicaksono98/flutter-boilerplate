import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/product/presentation/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailPage extends ConsumerWidget {
  final int id;

  const ProductDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: productAsync.when(
        data: (product) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.image,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                product.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
