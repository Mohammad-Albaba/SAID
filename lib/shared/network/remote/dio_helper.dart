import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.199:8000/api',
        // headers: {
        //   'Content-Type': 'application/json',
        // },
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'accept': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'accept': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return dio.post(
      url,
      queryParameters: query ?? null,
      data: data,
    );
  }

  static Future<Response> postOrder({
    @required String url,
    @required FormData data,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'accept': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return dio.post(
      url,
      queryParameters: query ?? null,
      data: data,
    );
  }

  static Future<Response> putData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
    String lang = 'en',
    String token,
  }) async {
    dio.options.headers = {
      'accept': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };
    return dio.put(
      url,
      queryParameters: query ?? null,
      data: data,
    );
  }
}
