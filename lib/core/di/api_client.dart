import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view/widget/toast.dart';
import 'api_provider.dart';
// com.nursery.driver

class ApiClient extends GetConnect implements GetxService{
  String? token;
  String adminToken = 'admin_master_token=we2code_123456';
  final String apkBaseUrl;
  Map<String,String>? _mainHeaders;
  final SharedPreferences sharedPreferences;
  ApiClient({required this.sharedPreferences,required this.apkBaseUrl}){
    httpClient.baseUrl = apkBaseUrl;
    httpClient.timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(ApiProvider.preferencesToken);
    _mainHeaders = { "driver_token" : "$token" };
  }

  updateHeader(String token){
    this.token = token;
    _mainHeaders = { "driver_token" : token };
  }

  static const String noInternetMessage = 'Please Check Your Connection';
  static const int noInternetCode = -1;
  static const int apiError = 1;
// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNjg2NzQxNjgyfQ.0C_3K7ZH5KKUpJ7qA0VpGeDxN0O74kgv9YpbIT6VpK8
//  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNjg2NzQxNjgyfQ.0C_3K7ZH5KKUpJ7qA0VpGeDxN0O74kgv9YpbIT6VpK8
  Future<Response> getAPI(String uri, {Map<String, dynamic>? query, Map<String, String>? headers, bool useHeader = true}) async {
    try {
      print("LOGIN_TOKEN_2 ${useHeader ? headers ?? _mainHeaders : null}");
      return _handleResponse(await get(uri,headers: useHeader ? headers ?? _mainHeaders : null));
    } on SocketException {
      return Future.error(const Response(statusCode: noInternetCode, statusText: noInternetMessage));
    } catch (e) {
      return Future.error(Response(statusCode: 1, statusText: e.toString()));
    }
  }


  Future<Response> postAPI(String? url, dynamic body, {Map<String, dynamic>? query,Map<String, String>? headers,bool useHeader = true}) async {
    try {
      return _handleResponse(await post(url, body,headers: useHeader ? headers ?? _mainHeaders : null));
    } on SocketException {
      return Future.error(const Response(statusCode: noInternetCode, statusText: noInternetMessage));
    }catch (e) {
      return Future.error(Response(statusCode: 1, statusText: e.toString()));
    }
  }

  Future<Response> putAPI(String url, dynamic body, {Map<String, dynamic>? query,Map<String, String>? headers,bool useHeader = true}) async {
    try {
      return _handleResponse(await put(url,body,headers: useHeader ? headers ?? _mainHeaders : null,));
    } on SocketException {
      return Future.error(const Response(statusCode: noInternetCode, statusText: noInternetMessage));
    }catch (e) {
      return Future.error(Response(statusCode: 1, statusText: e.toString()));
    }
  }

  Future<Response> _handleResponse(Response response) async{
    if(response.status.connectionError){
      Toast.short(toastMessage: "Please Check Your Connection",iconData: Icons.wifi_off,isError: true);
      return Future.error(const Response(statusCode: noInternetCode, statusText: noInternetMessage));
    }else if(response.statusCode == 200){
      return Future.value(response);
    }
    return Future.error(response);
  }
}