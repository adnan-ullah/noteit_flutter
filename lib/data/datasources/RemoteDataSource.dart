import 'dart:convert';

import 'package:noteit/data/model/WeatherEntity.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../exception.dart';

abstract class RemoteDataSource {
  Future<WeatherEntity> getCurrentWeather(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherEntity> getCurrentWeather(String cityName) async {
    final response =
    await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherEntity.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
