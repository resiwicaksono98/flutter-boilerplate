import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/error/failure.dart';
import 'package:flutter_boilerplate/features/product/data/datasources/product_remote_ds.dart';
import 'package:flutter_boilerplate/features/product/data/models/product_model.dart';
import 'package:flutter_boilerplate/features/product/domain/entities/product.dart';
import 'package:flutter_boilerplate/features/product/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_impl.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(ref.watch(productRemoteDSProvider));
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDS _remoteDS;

  ProductRepositoryImpl(this._remoteDS);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final productModels = await _remoteDS.getProducts();
      final products = productModels.map((e) => e.toEntity()).toList();
      return right(products);
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'API Error'));
    } catch (e) {
      return left(const ServerFailure('Unknown Error'));
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(int id) async {
    try {
      final productModel = await _remoteDS.getProduct(id);
      return right(productModel.toEntity());
    } on DioException catch (e) {
      return left(ServerFailure(e.message ?? 'API Error'));
    } catch (e) {
      return left(const ServerFailure('Unknown Error'));
    }
  }
}
