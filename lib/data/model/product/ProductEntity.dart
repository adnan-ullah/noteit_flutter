import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:objectbox/objectbox.dart';

part 'ProductEntity.freezed.dart';

part 'ProductEntity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  @Entity(realClass: ProductEntity)
  const factory ProductEntity(
      {
          @Id(assignable: true) required int id,
          required String title,
          required String description,
          required double price,
          required  double discountPercentage,
          required double rating,
          required int stock,
          required String brand,
          required String category,
          required String thumbnail,
     @Default([]) List<String> images}) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductEntityFromJson(json);

  Product toMap ()=> Product(id: id, title: title, description: description, price: price, discountPercentage: discountPercentage, rating: rating, stock: stock, brand: brand, category: category, thumbnail: thumbnail, images: images);

}
