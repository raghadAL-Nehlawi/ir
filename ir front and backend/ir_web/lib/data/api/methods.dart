import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import 'api.dart';

abstract class Methods {


   static Future<ApiResult> post(
      {required String url, Options? options, Map<String,dynamic>? data}) async {

    try {
      final _dio = Dio();
      final dio.Response response = await _dio.post(url!, data: data, options: options,);
      print('response : ${response.data}');

      if (response.data['status'] == true)
        return ApiResult.successFromJson(response.data);
      else
        return ApiResult.failureFromJson(response.data);
    } catch (e) {
      print(e);

      throw ApiResult.failure(NetworkExceptions.getErrorMessage(e));
    }

  }

  static Future<ApiResult> get({String? url, Options? options, Map<String, dynamic>? data }) async {
    try {
      final _dio = Dio();
      var response = await _dio.get(url!, options: options,queryParameters: data
      );
      print('response ${url.split('').last}: ${response.data}');
      if (response.data['status'] == 1)
        return ApiResult.successFromJson(response.data);
      else
        return ApiResult.failureFromJson(response.data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(e));
    }
  }


  static Future<ApiResult> put({String? url, Options? options,  data }) async {
    try {
      final _dio = Dio();
      var response = await _dio.put(url!, options: options,data: data);
      print('response ${url.split('').last}: ${response.data}');
      if (response.data['status'] == true)
        return ApiResult.successFromJson(response.data);
      else
        return ApiResult.failureFromJson(response.data);
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getErrorMessage(e));
    }
  }
}
