import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/error/failure.dart';

extension DioExceptionX on DioException {
  Failure toFailure() {
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const Failure.network();
      case DioExceptionType.badResponse:
        final statusCode = response?.statusCode;
        if (statusCode == 401) {
          return const Failure.unauthorized();
        }
        return Failure.server(response?.statusMessage);
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return Failure.unknown(error);
    }
  }
}
