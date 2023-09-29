import 'package:equatable/equatable.dart';

import '../../../domain/models/Product.dart';

abstract class ProductEvent extends Equatable{

  const ProductEvent();
  @override
  List<Object?> get props => [];

}

class InitEvent extends ProductEvent {}
class ShowAllProducts extends ProductEvent {
  List<Product>? _allProducts = null;
  ShowAllProducts(this._allProducts);

  @override
  List<Object?> get props => [_allProducts];

}