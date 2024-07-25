import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../model/login_model.dart';
import 'state.dart';

class CommonLogic extends GetxController {
  final CommonState state = CommonState(); // 全局数据状态

  @override
  void onReady() {
    super.onReady();

    setStateBarHeight();
  }

  setStateBarHeight() {
    BuildContext context = Get.context!;
    state.statusBarHeight = MediaQuery.of(context).padding.top;
    update();
  }

  setUserInfo(User user) {
    state.userInfo = user;
    update();
  }
}
