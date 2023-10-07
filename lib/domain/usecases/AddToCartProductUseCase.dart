import 'package:dartz/dartz.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:noteit/domain/repositories/product_repository.dart';

import '../../data/failure.dart';

class AddToCartProductUseCase {
  final ProductRepository repository;

  AddToCartProductUseCase(this.repository);

  Future<void> execute(Product cartProduct) {
    return repository.addToCartProduct(cartProduct);
  }

}
