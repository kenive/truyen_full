import 'dart:async';
import "package:dio/dio.dart";
import 'package:flutter/foundation.dart';

class ClientApi {
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(CustomInterceptors(_dio));

    ///url api
    _dio.options.baseUrl = "https://truyen-clone.getdata.one";
    // _dio.options.receiveTimeout = 1000001;
    return _dio;
  }
}

class CustomInterceptors extends QueuedInterceptor {
  final Dio _dio;
  CustomInterceptors(this._dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint(
      'REQUEST[${options.method}] => PATH: ${options.path}',
    );

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print("In File: api_client.dart, Line: 21 $response ");
      print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }

    super.onResponse(response, handler);
    return Future.value(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    debugPrint('$err');
    Map<String, dynamic>? data = err.response?.data;

    if (kDebugMode) {
      print("In File: api_client.dart, Line: 39 ${err.response} ");
    }

    super.onError(err, handler);
    return Future.error(err);
  }
}
