import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/common/logic.dart';
import '/popup/loading.dart';
import 'dart:async';
import 'state.dart';

class VerifyForPayPasswordLogic extends GetxController {
  final VerifyForPayPasswordState state = VerifyForPayPasswordState();
  final commonState = Get.find<CommonLogic>().state; // 全局数据状态

  /// 支付密码发送验证码并开启倒计时
  void sent() {
    print(commonState.payPasswordSendVerifyState.value);
    if (!commonState.payPasswordSendVerifyState.value) return;
    commonState.payPasswordSendVerifyCountdown.value = 59;
    commonState.payPasswordSendVerifyState.value = false;
    FocusScope.of(state.context!).requestFocus(state.focus1);
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (commonState.payPasswordSendVerifyCountdown <= 0) {
        commonState.payPasswordSendVerifyButtonStr.value = '重新发送';
        commonState.payPasswordSendVerifyState.value = true;
        timer.cancel(); // 关闭计时器
        return;
      }
      commonState.payPasswordSendVerifyCountdown.value--;
      commonState.payPasswordSendVerifyButtonStr.value = '${commonState.payPasswordSendVerifyCountdown.value}秒后可重新发送';
    });
  }

  void setContext(BuildContext context) {
    state.context = context;
  }

  void setCode() {
    state.code = state.inputController1.text +
        state.inputController2.text +
        state.inputController3.text +
        state.inputController4.text +
        state.inputController5.text +
        state.inputController6.text;
  }

  void inputChange1(value) {
    state.inputController1.text = value;
    FocusScope.of(state.context!).requestFocus(state.focus2);
    setCode();
    update();
  }

  void inputChange2(value) {
    state.inputController2.text = value;
    FocusScope.of(state.context!).requestFocus(state.focus3);
    setCode();
    update();
  }

  void inputChange3(value) {
    state.inputController3.text = value;
    FocusScope.of(state.context!).requestFocus(state.focus4);
    setCode();
    update();
  }

  void inputChange4(value) {
    state.inputController4.text = value;
    FocusScope.of(state.context!).requestFocus(state.focus5);
    setCode();
    update();
  }

  void inputChange5(value) {
    state.inputController5.text = value;
    FocusScope.of(state.context!).requestFocus(state.focus6);
    setCode();
    update();
  }

  void inputChange6(value) {
    state.inputController6.text = value;
    setCode();
    print('password: ' + state.code);
    loading();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.back();
      Get.snackbar('错误提示', '验证码错误,请重试!');
      state.inputController1.text = state.inputController2.text =
          state.inputController3.text = state.inputController4.text = state.inputController5.text = state.inputController6.text = '';
      update();
      setCode();
      Timer(Duration(seconds: 1), () {
        // 延迟1秒执行
        FocusScope.of(state.context!).requestFocus(state.focus1);
      });
    });
  }

  void keyboardListener(RawKeyEvent event) {
    if (event.logicalKey.keyLabel == 'Backspace' && event is RawKeyDownEvent) {
      switch (state.code.length) {
        case 5:
          state.inputController5.text = '';
          setCode();
          update();
          Future.delayed(const Duration(milliseconds: 100), () {
            FocusScope.of(state.context!).requestFocus(state.focus5);
          });
          break;
        case 4:
          state.inputController4.text = '';
          setCode();
          update();
          Future.delayed(const Duration(milliseconds: 100), () {
            FocusScope.of(state.context!).requestFocus(state.focus4);
          });
          break;
        case 3:
          state.inputController3.text = '';
          setCode();
          update();
          Future.delayed(const Duration(milliseconds: 100), () {
            FocusScope.of(state.context!).requestFocus(state.focus3);
          });
          break;
        case 2:
          state.inputController2.text = '';
          setCode();
          update();
          Future.delayed(const Duration(milliseconds: 100), () {
            FocusScope.of(state.context!).requestFocus(state.focus2);
          });
          break;
        case 1:
          state.inputController1.text = '';
          setCode();
          update();
          Future.delayed(const Duration(milliseconds: 100), () {
            FocusScope.of(state.context!).requestFocus(state.focus1);
          });
          break;
        default:
      }
    }
  }

  @override
  void onReady() {
    FocusScope.of(state.context!).requestFocus(state.focus1);

    update();
    super.onReady();
  }
}
