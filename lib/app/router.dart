import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/widgets/scaffold_with_nav_bar.dart';
import 'package:flutter_boilerplate/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_boilerplate/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_boilerplate/features/product/presentation/pages/product_detail_page.dart';
import 'package:flutter_boilerplate/features/product/presentation/pages/product_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoggingIn) return '/login';
      if (isLoggedIn && isLoggingIn) return '/';

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
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
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) =>
                    const Scaffold(body: Center(child: Text('Profile Page'))),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
