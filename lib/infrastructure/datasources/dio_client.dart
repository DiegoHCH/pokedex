import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  
  late Dio _dio;
  
  DioClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
    
    // Interceptor para logging (opcional)
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => print(obj),
    ));
  }
  
  factory DioClient() => _instance;
  
  Dio get dio => _dio;
}
