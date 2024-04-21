import 'package:dio/dio.dart';
import 'package:quick_eats/api/endpoints.dart';
import 'package:quick_eats/api/http.dart';

class RestaurantService {

  // To get all restaurants
  Future<Response> getRestaurants() {
    return dio.get(Endpoints.getRestaurants);
  }
}
