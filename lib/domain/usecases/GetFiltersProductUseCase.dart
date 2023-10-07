import 'package:dartz/dartz.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:noteit/domain/repositories/product_repository.dart';

import '../../data/failure.dart';

class GetFiltersProductUseCase {
  final ProductRepository repository;

  GetFiltersProductUseCase(this.repository);

  Future<Either<Failure, List<Product>>> execute(String filter) {
    return repository.getFilterProducts(filter);
  }

}
