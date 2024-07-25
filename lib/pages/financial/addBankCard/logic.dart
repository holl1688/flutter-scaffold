import 'package:get/get.dart';

import '/model/bank_options_model.dart';
import '/request/provider/financial.dart';
import 'state.dart';

class AddBankCardLogic extends GetxController {
  final AddBankCardState state = AddBankCardState();
  FinancialProvider financialProvider = Get.put(FinancialProvider()); // 网络接口实例

  @override
  void onInit() {
    withdrawConfig();

    super.onInit();
  }

  /// 获取银行选项列表
  void withdrawConfig() async {
    final Map<String, dynamic> params = {'select': 'id,bank_name', 'tenant_id': 'eq.571849', 'state': 'eq.true', 'order': 'id.asc'};
    Response response = await financialProvider.withdrawConfig(params);
    try {
      BankOptionsModel bankOptionsModel = BankOptionsModel.fromJson(response.body);
    } catch (error) {
      //
    } finally {}
  }
}
