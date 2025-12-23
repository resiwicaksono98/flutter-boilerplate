import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            ref.read(authProvider.notifier).login();
          },
          child: const Text('Login Mock'),
        ),
      ),
    );
  }
}
