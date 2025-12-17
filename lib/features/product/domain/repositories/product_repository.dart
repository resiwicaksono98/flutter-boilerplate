import 'package:fpdart/fpdart.dart';
import 'package:flutter_boilerplate/core/error/failure.dart';
import 'package:flutter_boilerplate/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProduct(int id);
}
