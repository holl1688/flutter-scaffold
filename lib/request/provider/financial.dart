import 'package:get/get_connect/http/src/response/response.dart';

import '../connect.dart';

/// 获取银行选项列表
class FinancialProvider extends BaseConnect {
  Future<Response<dynamic>> withdrawConfig(Map<String, dynamic> params) => get('/rest/v1/withdraw_config', query: params);
}