import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._(); // Added private constructor for custom methods

  const factory Failure.server(String? errorMsg) = _Server;
  const factory Failure.network() = _Network;
  const factory Failure.unauthorized() = _Unauthorized;
  const factory Failure.unknown(Object? error) = _Unknown;

  String get message {
    return when(
      server: (errorMsg) => errorMsg ?? 'Server Error',
      network: () => 'No Internet Connection',
      unauthorized: () => 'Unauthorized Access',
      unknown: (err) => 'Unknown Error: $err',
    );
  }
}
