import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:noteit/domain/models/Product.dart';
import 'package:noteit/domain/repositories/product_repository.dart';

import '../../main.dart';
import '../datasources/RemoteDataSource.dart';
import '../exception.dart';
import '../failure.dart';
import '../model/product/ProductEntity.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;
  var productBox = objectbox.store.box<ProductEntity>();

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    List<Product> allProducts = [];
    try {
      final result = await remoteDataSource.getAllProducts();
      for (var e in result) {
        allProducts.add(e.toMap());
      }

      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getFilterProducts(
      String filterText) async {
      List<Product> allProducts = [];
      try {
      final result = await remoteDataSource.getAllProducts();
      for (var e in result) {
        if (e.title!.startsWith(filterText)) allProducts.add(e.toMap());
      }

      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<void> addToCartProduct(Product cartProduct) async {
    print("Hello Add to Cart");
  }

  @override
  Future<Either<Failure, List<Product>>> getAllCartProducts() async {
    List<Product> allProducts = [];
    try {
      final result = await remoteDataSource.getAllProducts();
      for (var e in result) {
        allProducts.add(e.toMap());
      }

      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Either<Failure, List<Product>> getAllProductsFromDB() {
    List<Product> allProducts = [];
    try {
      final result = productBox.getAll();
      for (var e in result) {
        allProducts.add(e.toMap());
      }

      return Right(allProducts);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
