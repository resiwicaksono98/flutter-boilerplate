import 'package:flutter_boilerplate/features/product/domain/entities/product.dart';
import 'package:flutter_boilerplate/features/product/domain/usecases/get_products.dart';
import 'package:flutter_boilerplate/features/product/data/repositories/product_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class Products extends _$Products {
  @override
  FutureOr<List<Product>> build() async {
    return _fetchProducts();
  }

  Future<List<Product>> _fetchProducts() async {
    final getProducts = ref.watch(getProductsProvider);
    final result = await getProducts();
    
    return result.fold(
      (failure) => throw Exception(failure.message),
      (products) => products,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchProducts());
  }
}

// TODO: Create a UseCase for getProduct(id) similarly
@riverpod
Future<Product> product(ProductRef ref, int id) async {
  final repository = ref.watch(productRepositoryProvider);
  final result = await repository.getProduct(id);
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (product) => product,
  );
}
