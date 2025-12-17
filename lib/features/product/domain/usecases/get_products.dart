import 'package:flutter_boilerplate/core/error/failure.dart';
import 'package:flutter_boilerplate/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_boilerplate/features/product/domain/entities/product.dart';
import 'package:flutter_boilerplate/features/product/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_products.g.dart';

@riverpod
GetProducts getProducts(GetProductsRef ref) {
  return GetProducts(ref.watch(productRepositoryProvider));
}

class GetProducts {
  final ProductRepository _repository;

  GetProducts(this._repository);

  Future<Either<Failure, List<Product>>> call() {
    return _repository.getProducts();
  }
}
