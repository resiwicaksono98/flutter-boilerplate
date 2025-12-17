import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/network/dio_client.dart';
import 'package:flutter_boilerplate/features/product/data/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_remote_ds.g.dart';

@riverpod
ProductRemoteDS productRemoteDS(ProductRemoteDSRef ref) {
  return ProductRemoteDS(ref.watch(dioProvider));
}

class ProductRemoteDS {
  final Dio _dio;

  ProductRemoteDS(this._dio);

  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductModel> getProduct(int id) async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products/$id');
      
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
