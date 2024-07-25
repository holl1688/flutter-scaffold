import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:get/route_manager.dart';

import '/config/network.dart';
import '/hooks/generate.dart';
import '/storage/index.dart';

const String apiKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJqaXVpb3BrYXlsaHZvc2ZnaXpkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODY4OTk3NjcsImV4cCI6MjAwMjQ3NTc2N30.cDKiFKuAfmmDpZrKYTzg2OPLVP6DZ_7bESFnCEgoehA';

class BaseConnect extends GetConnect {
  @override
  void onInit() {
    /// 创建公共接口地址
    httpClient.baseUrl = apiBaseUrl;

    /// 请求拦截
    httpClient.addRequestModifier<void>((request) async {
      String? token = Storage.getString(StorageKeys.token);
      print(token);
      request.headers['ApiKey'] = apiKey;
      request.headers['Authorization'] = genToken(token ?? '');
      return request;
    });

    /// 响应拦截
    httpClient.addResponseModifier((request, response) {
      if (response.hasError) {
        Get.snackbar('请求错误', json.decode(response.body.toString()));
      }
      // 处理逻辑
      return response;
    });

    GetSocket userMessages() {
      return socket('https://yourapi/users/socket');
    }
  }
}
