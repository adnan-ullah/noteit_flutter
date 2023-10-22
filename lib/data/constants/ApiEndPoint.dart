import 'package:noteit/data/model/product/ProductEntity.dart';
abstract class ApiEndPoint {

  static const PRODUCTS = '/products';
  static const USER = '/user';
  static const AUTH = ProductEntity;
  static const apiList = [PRODUCTS, USER];

  static dynamic GetEntity(String apiName){
    switch(apiName)
        {
      case PRODUCTS: ProductEntity;
      break;
      case USER: ProductEntity;
      break;
    }
  }
}
