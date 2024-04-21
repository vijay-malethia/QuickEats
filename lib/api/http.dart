import 'package:dio/dio.dart';
import 'interceptors.dart';

// Dio object initialized with the given base URL.
final dio = Dio(BaseOptions(baseUrl: 'https://quickeats.free.beeceptor.com'));

// Function to initialize the Dio object with a new DioInterceptors instance.
void initDio() {
  dio.interceptors.add(DioInterceptors());
}
