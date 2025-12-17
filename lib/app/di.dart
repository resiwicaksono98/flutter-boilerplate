// Dependency Injection configuration
// Since we are using Riverpod, most dependencies are managed via Providers.
// This file can be used for initializing other global services (e.g., Firebase, Hive, etc.)
// or re-exporting core providers if needed.

import 'package:flutter_boilerplate/core/network/dio_client.dart';

// Example: Exporting the dio provider for easier access if needed (though direct import is preferred)
export 'package:flutter_boilerplate/core/network/dio_client.dart';

Future<void> initDependencies() async {
  // Initialize services here
}
