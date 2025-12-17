import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/product/presentation/pages/product_detail_page.dart';
import 'package:flutter_boilerplate/features/product/presentation/pages/product_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ProductPage(),
        routes: [
          GoRoute(
            path: 'product/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return ProductDetailPage(id: id);
            },
          ),
        ],
      ),
    ],
  );
}
