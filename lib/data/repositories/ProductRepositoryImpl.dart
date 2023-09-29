import 'dart:io';


import 'package:dartz/dartz.dart';
import 'package:noteit/data/model/ProductEntity.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:noteit/domain/repositories/product_repository.dart';

import '../../domain/models/Weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/RemoteDataSource.dart';
import '../exception.dart';
import '../failure.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    List<Product> allProducts =[];
    try {
      final result = await remoteDataSource.getAllProducts();
      for(var e in result)
        {
          allProducts.add(e.toEntity());
        }
      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
