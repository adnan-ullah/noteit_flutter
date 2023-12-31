import 'dart:io';


import 'package:dartz/dartz.dart';

import '../../domain/models/Weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/RemoteDataSource.dart';
import '../exception.dart';
import '../failure.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

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
}
