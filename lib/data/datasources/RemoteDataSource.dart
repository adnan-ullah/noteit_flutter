import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:noteit/data/constants/ApiEndPoint.dart';
import 'package:noteit/data/model/WeatherEntity.dart';

import '../../main.dart';
import '../constants/constants.dart';
import '../exception.dart';
import '../model/product/ProductEntity.dart';

abstract class RemoteDataSource {
  Future<WeatherEntity> getCurrentWeather(String cityName);

  Future<List<ProductEntity>> getAllProducts();

  Future syncAllApi();
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
    print("asf"+ "csa".toString());
    var productBox = objectbox.store.box<ProductEntity>();
    final response = await client.get(Uri.parse(Urls.currentAllProducts()));
    List<ProductEntity> allProducts = [];
    if (response.statusCode == 200) {
      List<dynamic> values = jsonDecode(response.body)['products'];


      for (var e in values) {
        productBox.put(ProductEntity.fromJson(e));
        allProducts.add(ProductEntity.fromJson(e as Map<String, dynamic>));
      }

      return allProducts;
    } else
      throw ServerException();
  }

  @override
  Future syncAllApi() async {
    dynamic apiList = ApiEndPoint.apiList;
    for (var api in apiList) {
      var box;
      if (api == ApiEndPoint.PRODUCTS) {
        box = objectbox.store.box<ProductEntity>();
      }

      final response = await client.get(Uri.parse(Urls.baseUrl + api));
      if (response.statusCode == 200) {
        List<dynamic> values = jsonDecode(response.body)['products'];
        for (var e in values) {
          box.put(ProductEntity.fromJson(e));
        }
      }
    }
  }
}
