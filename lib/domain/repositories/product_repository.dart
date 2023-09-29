import 'package:dartz/dartz.dart';
import 'package:noteit/domain/models/Product.dart';

import '../../data/failure.dart';
import '../models/Weather.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
}
