import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/login_model.dart';
import '../theme/index.dart';

class CommonState {
  late User? userInfo; // 定义变量-用户信息
  late double statusBarHeight; // 状态栏高度
  late RxBool payPasswordSendVerifyState; // 支付密码发送验证码状态(true:可以发送)
  late RxInt payPasswordSendVerifyCountdown; // 支付密码发送验证码倒计时
  late RxString payPasswordSendVerifyButtonStr; // 支付密码发送验证码按钮文本
  late Rx<ThemeData?> currentTheme; // 当前主题

  CommonState() {
    userInfo = null; // 初始化-用户信息
    statusBarHeight = 0.0;
    payPasswordSendVerifyState = true.obs;
    payPasswordSendVerifyCountdown = 0.obs;
    payPasswordSendVerifyButtonStr = '发送'.obs;
    currentTheme = themes['dark'].obs;
  }
}
