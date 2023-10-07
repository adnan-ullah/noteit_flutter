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

class ShowFiltersProducts extends ProductEvent {
  String filterText;
  ShowFiltersProducts(this.filterText);

  @override
  List<Object?> get props => [filterText];

}

class AddToCart extends ProductEvent {
  Product cartProduct;
  AddToCart(this.cartProduct);

  @override
  List<Object?> get props => [cartProduct];

}

class ShowCartList extends ProductEvent {
  List<Product>? _allCartProducts = null;
  ShowCartList(this._allCartProducts);

  @override
  List<Object?> get props => [_allCartProducts];

}