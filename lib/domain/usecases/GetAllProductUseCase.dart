import 'package:dartz/dartz.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:noteit/domain/repositories/product_repository.dart';

import '../../data/failure.dart';

class GetAllProductUseCase {
  final ProductRepository repository;

  GetAllProductUseCase(this.repository);

  Future<Either<Failure, List<Product>>> execute() {
    return repository.getAllProducts();
  }
}
