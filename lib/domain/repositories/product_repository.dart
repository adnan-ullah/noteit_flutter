import 'package:dartz/dartz.dart';
import 'package:noteit/domain/models/Product.dart';

import '../../data/failure.dart';
import '../models/Weather.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<Product>>> getFilterProducts(String filterText);
  Future<void> addToCartProduct(Product cartProduct);
  Future<Either<Failure, List<Product>>> getAllCartProducts();
  // Future<void> saveData(List<Product> data);
  // Future<List<Product>> getAllDataFromBox();

}
