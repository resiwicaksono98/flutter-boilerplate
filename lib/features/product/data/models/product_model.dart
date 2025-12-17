import 'package:flutter_boilerplate/features/product/domain/entities/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._(); // Needed for custom methods/getters

  const factory ProductModel({
    required int id,
    required String title,
    required String description,
    required double price,
    required String image,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  // Mapper to Entity
  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      image: image,
    );
  }
}
