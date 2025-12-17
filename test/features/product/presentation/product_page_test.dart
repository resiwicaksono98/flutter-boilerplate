import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/product/domain/entities/product.dart';
import 'package:flutter_boilerplate/features/product/presentation/pages/product_page.dart';
import 'package:flutter_boilerplate/features/product/presentation/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Mock class for Products Notifier
class MockProducts extends Products {
  final List<Product> _initialProducts;
  
  MockProducts(this._initialProducts);

  @override
  FutureOr<List<Product>> build() {
    return _initialProducts;
  }
}

class MockProductsLoading extends Products {
  @override
  FutureOr<List<Product>> build() {
    return Future.delayed(const Duration(seconds: 1), () => []);
  }
}

void main() {
  testWidgets('ProductPage displays list of products', (tester) async {
    const tProduct = Product(
      id: 1,
      title: 'Test Product',
      description: 'Description',
      price: 100.0,
      image: 'https://via.placeholder.com/150',
    );
    final tProducts = [tProduct];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          productsProvider.overrideWith(() => MockProducts(tProducts)),
        ],
        child: const MaterialApp(
          home: ProductPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('\$100.0'), findsOneWidget);
  });

  testWidgets('ProductPage displays loading indicator', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          productsProvider.overrideWith(() => MockProductsLoading()),
        ],
        child: const MaterialApp(
          home: ProductPage(),
        ),
      ),
    );

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    
    await tester.pump(const Duration(seconds: 1));
  });
}
