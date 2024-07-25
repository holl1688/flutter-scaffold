import 'package:get/get.dart';

import 'state.dart';

class MarketLogic extends GetxController {
  final MarketState state = MarketState();

  /// 下一步按钮事件
  void onStepContinue() {
    switch (state.currentStep.value) {
      case 0:
        Get.toNamed('bindIdentity');
    }
  }

  void onStepCancel() {
    if (state.currentStep.value > 0) {
      state.currentStep.value--;
    }
  }

  void onStepTapped(int index) {
    print(index);
  }

  @override
  void onInit() {
    super.onInit();

    debounce(state.currentStep, (value) {
      print(value);
      if (value > 20) {
        Get.snackbar('添加消息', state.currentStep.toString());
      }
    });
  }
}
