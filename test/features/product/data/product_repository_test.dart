import 'package:flutter_boilerplate/core/error/failure.dart';
import 'package:flutter_boilerplate/features/product/data/datasources/product_remote_ds.dart';
import 'package:flutter_boilerplate/features/product/data/models/product_model.dart';
import 'package:flutter_boilerplate/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_boilerplate/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRemoteDS extends Mock implements ProductRemoteDS {}

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDS mockRemoteDS;

  setUp(() {
    mockRemoteDS = MockProductRemoteDS();
    repository = ProductRepositoryImpl(mockRemoteDS);
  });

  const tProductModel = ProductModel(
    id: 1,
    title: 'Test Product',
    description: 'Description',
    price: 100.0,
    image: 'image.jpg',
  );
  
  final tProduct = tProductModel.toEntity();
  final tProductModels = [tProductModel];
  final tProducts = [tProduct];

  group('getProducts', () {
    test('should return list of products when remote call is successful', () async {
      // Arrange
      when(() => mockRemoteDS.getProducts()).thenAnswer((_) async => tProductModels);

      // Act
      final result = await repository.getProducts();

      // Assert
      result.fold(
        (l) => fail('Should be Right'),
        (r) => expect(r, tProducts),
      );
      verify(() => mockRemoteDS.getProducts()).called(1);
    });

    test('should return ServerFailure when remote call throws exception', () async {
      // Arrange
      when(() => mockRemoteDS.getProducts()).thenThrow(Exception());

      // Act
      final result = await repository.getProducts();

      // Assert
      expect(result, isA<Left<Failure, List<Product>>>());
      verify(() => mockRemoteDS.getProducts()).called(1);
    });
  });
}
