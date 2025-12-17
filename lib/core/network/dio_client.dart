import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/storage/local_storage.dart';
import 'package:flutter_boilerplate/core/utils/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL'] ?? 'https://api.example.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  final localStorage = ref.watch(localStorageProvider);

  // Add interceptors
  dio.interceptors.addAll([
    AuthInterceptor(localStorage),
    DioLoggerInterceptor(),
  ]);

  return dio;
}

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;

  AuthInterceptor(this._localStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _localStorage.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // TODO: Implement Token Refresh Logic
      // 1. Lock request queue
      // 2. Call refresh token API
      // 3. Update local storage
      // 4. Unlock and retry request
      // 5. If refresh fails, logout
    }
    handler.next(err);
  }
}

class DioLoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('Request: ${options.method} ${options.path}\nData: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('Response: ${response.statusCode} ${response.statusMessage}\nData: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('Error: ${err.message}', error: err, stackTrace: err.stackTrace);
    handler.next(err);
  }
}
