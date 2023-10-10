import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:noteit/data/model/WeatherEntity.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../exception.dart';
import '../model/product/ProductEntity.dart';

abstract class RemoteDataSource {
  Future<WeatherEntity> getCurrentWeather(String cityName);
  Future<List<ProductEntity>> getAllProducts();
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

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final response = await client.get(Uri.parse(Urls.currentAllProducts()));
     List<ProductEntity> allProducts =[];
    if(response.statusCode == 200)
      {
        List<dynamic> values = jsonDecode(response.body)['products'];
        for (var e in values) {
          allProducts.add(ProductEntity.fromJson(e as Map<String, dynamic>));
        }

        return allProducts;
      }
    else
      throw ServerException();
  }
}
