import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/logic.dart';
import 'logic.dart';

class VerifyForPayPasswordPage extends StatelessWidget {
  VerifyForPayPasswordPage({Key? key}) : super(key: key);

  final commonState = Get.find<CommonLogic>().state;
  final logic = Get.put(VerifyForPayPasswordLogic());
  final state = Get.find<VerifyForPayPasswordLogic>().state;

  @override
  Widget build(BuildContext context) {
    logic.setContext(context);

    return GetBuilder<VerifyForPayPasswordLogic>(
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('获取手机验证码'),
          ),
          body: RawKeyboardListener(
            autofocus: true,
            focusNode: FocusNode(),
            onKey: logic.keyboardListener,
            child: Column(
              children: [
                Container(
                  height: 10,
                  color: Colors.grey.shade200,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('身份信息', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      Text.rich(
                          TextSpan(
                            children: <InlineSpan>[
                              TextSpan(
                                  text: '为保障您的账户安全，我们已将验证码发送至您预留的手机号码:188******78，如您收不到验证码请联系'),
                              TextSpan(
                                  text: '在线客服',
                                  style: const TextStyle(
                                      color: Colors.lightBlueAccent),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}
                              )
                            ],
                          )
                      ),
                      SizedBox(height:20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              child: Center(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 48,
                                    maxHeight: 48
                                  ),
                                  child: state.inputController1.text == '' ? TextField(
                                    focusNode: state.focus1,
                                    cursorColor: Colors.lightBlueAccent,
                                    cursorWidth: 1,
                                    textAlign: TextAlign.center,
                                    controller: state.inputController1,
                                    // 输入框控制器(清空输入内容时使用 _accountController.clear())
                                    inputFormatters: [
                                      // 显示输入格式
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9a-z]')),
                                      // 只允许小写字母和数字需要flutter/services.dart
                                      LengthLimitingTextInputFormatter(1),
                                      // 最大只能输入1位
                                    ],
                                    onChanged: logic.inputChange1,
                                    decoration: const InputDecoration(
                                      filled: true,
                                      enabledBorder: UnderlineInputBorder( // 输入时边框样式
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))
                                      ),
                                      focusedBorder: UnderlineInputBorder( // 输入时边框样式
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))
                                      )
                                    )
                                  ) : Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE7E0EA),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.circle),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            child: Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 48,
                                  maxHeight: 48
                                ),
                                child:  state.inputController2.text == '' ? TextField(
                                  focusNode: state.focus2,
                                  cursorColor: Colors.lightBlueAccent,
                                  cursorWidth: 1,
                                  textAlign: TextAlign.center,
                                  controller: state.inputController2,
                                  // 输入框控制器(清空输入内容时使用 _accountController.clear())
                                  inputFormatters: [
                                    // 显示输入格式
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9a-z]')),
                                    // 只允许小写字母和数字需要flutter/services.dart
                                    LengthLimitingTextInputFormatter(1),
                                    // 最大只能输入1位
                                  ],
                                  onChanged: logic.inputChange2,
                                  decoration: const InputDecoration(
                                    filled: true,
                                    enabledBorder: UnderlineInputBorder( // 输入时边框样式
                                      borderSide: BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))
                                    ),
                                    focusedBorder: UnderlineInputBorder( // 输入时边框样式
                                      borderSide: BorderSide(
                                          color: Colors.transparent),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))
                                    )
                                  )
                                ) : Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE7E0EA),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Center(
                                    child: Icon(Icons.circle),
                                  ),
                                )
                              ),
                            )
                          ),
                          Expanded(
                              child: Center(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: 48,
                                      maxHeight: 48
                                  ),
                                  child:  state.inputController3.text == '' ? TextField(
                                      focusNode: state.focus3,
                                      cursorColor: Colors.lightBlueAccent,
                                      cursorWidth: 1,
                                      textAlign: TextAlign.center,
                                      controller: state.inputController3,
                                      // 输入框控制器(清空输入内容时使用 _accountController.clear())
                                      inputFormatters: [
                                        // 显示输入格式
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9a-z]')),
                                        // 只允许小写字母和数字需要flutter/services.dart
                                        LengthLimitingTextInputFormatter(1),
                                        // 最大只能输入1位
                                      ],
                                      onChanged: logic.inputChange3,
                                      decoration: const InputDecoration(
                                          filled: true,
                                          enabledBorder: UnderlineInputBorder( // 输入时边框样式
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))
                                          ),
                                          focusedBorder: UnderlineInputBorder( // 输入时边框样式
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))
                                          )
                                      )
                                  ) : Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE7E0EA),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.circle),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                              child: Center(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: 48,
                                      maxHeight: 48
                                  ),
                                  child:  state.inputController4.text == '' ? TextField(
                                      focusNode: state.focus4,
                                      cursorColor: Colors.lightBlueAccent,
                                      cursorWidth: 1,
                                      textAlign: TextAlign.center,
                                      controller: state.inputController4,
                                      // 输入框控制器(清空输入内容时使用 _accountController.clear())
                                      inputFormatters: [
                                        // 显示输入格式
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9a-z]')),
                                        // 只允许小写字母和数字需要flutter/services.dart
                                        LengthLimitingTextInputFormatter(1),
                                        // 最大只能输入1位
                                      ],
                                      onChanged: logic.inputChange4,
                                      decoration: const InputDecoration(
                                          filled: true,
                                          enabledBorder: UnderlineInputBorder( // 输入时边框样式
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))
                                          ),
                                          focusedBorder: UnderlineInputBorder( // 输入时边框样式
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))
                                          )
                                      )
                                  ) : Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE7E0EA),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.circle),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                              child: Center(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: 48,
                                      maxHeight: 48
                                  ),
                                  child:  state.inputController5.text == '' ? TextField(
                                      focusNode: state.focus5,
                                      cursorColor: Colors.lightBlueAccent,
                                      cursorWidth: 1,
                                      textAlign: TextAlign.center,
                                      controller: state.inputController5,
                                      // 输入框控制器(清空输入内容时使用 _accountController.clear())
                                      inputFormatters: [
                                        // 显示输入格式
                                        FilteringTextInputFormatter.allow(
                                            RegExp('[0-9a-z]')),
                                        // 只允许小写字母和数字需要flutter/services.dart
                                        LengthLimitingTextInputFormatter(1),
                                        // 最大只能输入1位
                                      ],
                                      onChanged: logic.inputChange5,
                                      decoration: const InputDecoration(
                                          filled: true,
                                          enabledBorder: UnderlineInputBorder( // 输入时边框样式
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))
                                          ),
                                          focusedBorder: UnderlineInputBorder( // 输入时边框样式
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))
                                          )
                                      )
                                  ) : Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE7E0EA),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Icon(Icons.circle),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                            child: Center(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 48,
                                  maxHeight: 48
                                ),
                                child:  state.inputController6.text == '' ? TextField(
                                  focusNode: state.focus6,
                                  cursorColor: Colors.lightBlueAccent,
                                  cursorWidth: 1,
                                  textAlign: TextAlign.center,
                                  controller: state.inputController6,
                                  // 输入框控制器(清空输入内容时使用 _accountController.clear())
                                  inputFormatters: [
                                    // 显示输入格式
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9a-z]')),
                                    // 只允许小写字母和数字需要flutter/services.dart
                                    LengthLimitingTextInputFormatter(1),
                                    // 最大只能输入1位
                                  ],
                                  onChanged: logic.inputChange6,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 12),
                                    filled: true,
                                    contentPadding: EdgeInsets.all(0),
                                    enabledBorder: UnderlineInputBorder( // 输入时边框样式
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))
                                    ),
                                    focusedBorder: UnderlineInputBorder( // 输入时边框样式
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))
                                    )
                                  )
                                ) : Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE7E0EA),
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Center(
                                    child: Icon(Icons.circle),
                                  ),
                                ),
                              ),
                            )
                          )
                        ],
                      )
                    ]
                  )
                ),
                Obx(() => Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: commonState.payPasswordSendVerifyState.value ? [Colors.orange, Colors.red] : [Colors.grey, Colors.grey],
                      ),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: MaterialButton(
                      onPressed: logic.sent,
                      child: Align(
                          child: Text(commonState.payPasswordSendVerifyButtonStr.value, style: TextStyle(color: Colors.white))
                      )
                  )
                ))
              ]
            )
          )
        );
      },
    );
  }
}