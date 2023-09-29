
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final dynamic price;
  final double? discountPercentage;
  final dynamic rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;

  Product(
      {required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required  this.stock,
        required  this.brand,
        required  this.category,
        required  this.thumbnail,
        required  this.images});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    discountPercentage,
    rating,
    stock,
    brand,
    category,
    thumbnail,
    images];
}


