import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.example.com', // replace with real endpoint
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 20),
    headers: {'Content-Type': 'application/json'},
  ));

  DioClient() {
    // Interceptors can be added here (loggers, auth)
    dio.interceptors.add(InterceptorsWrapper(onRequest: (o, handler) {
      // print('[REQ] ${o.method} ${o.path}');
      return handler.next(o);
    }));
  }
}
