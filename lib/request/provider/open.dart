import 'package:get/get_connect/http/src/response/response.dart';

import '../connect.dart';

/// 用户登录
class OpenProvider extends BaseConnect {
  Future<Response<dynamic>> login(Map<String, dynamic> data) => post('/auth/v1/token?grant_type=password', data);
}