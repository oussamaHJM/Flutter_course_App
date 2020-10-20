import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class dioHelper{
  Dio dio;
  dioHelper._privateConstructor(){
    dio ??= Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));
  }

  static final dioHelper _instance = dioHelper._privateConstructor();

  static dioHelper get instance => _instance;

  Future<dynamic> get(String route, [Map<String, dynamic> parameters]) async {
    dynamic responseDataJson;
    try{
      final response = await dio.get(route, queryParameters: parameters);
      responseDataJson = response.data;
      debugPrint("iefhjzoei,zpf");
    } on SocketException catch(e){
      debugPrint(e.message);
      throw Exception(e.message);
    } on DioError catch(e){
      debugPrint(e.message);
    }
    return responseDataJson;
  }
}