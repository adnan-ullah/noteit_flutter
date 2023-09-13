import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../models/Weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
