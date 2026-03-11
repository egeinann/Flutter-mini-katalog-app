import 'package:dio/dio.dart';
import 'package:mini_katalog_app/core/constants/api_constants.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}