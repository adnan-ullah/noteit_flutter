import 'package:equatable/equatable.dart';
import 'package:noteit/domain/models/Product.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoading extends ProductState{}
class ProductError extends ProductState{}
class AllProductsState extends ProductState{
  List<Product> allProducts;
  AllProductsState(this.allProducts);

  @override
  // TODO: implement props
  List<Object?> get props => [allProducts];

}


