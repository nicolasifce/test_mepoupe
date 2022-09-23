import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import 'interceptions.dart';

class DioService extends DioForNative {
  static const _baseUrl = "https://viacep.com.br/ws/";

  DioService() : super() {
    options = BaseOptions(
        baseUrl: _baseUrl, connectTimeout: 5000, receiveTimeout: 5000);

    interceptors.add(AppInterceptors(this));
  }
}
