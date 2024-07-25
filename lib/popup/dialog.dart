import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future normalDialog(
    {String title = '提示',
    String middleText = '确认操作?',
    String cancelText = '取消',
    String confirmText = '确认',
    bool showCancel = true,
    void Function()? onConfirm}) {
  return Get.defaultDialog(
    barrierDismissible: false,

    /// 点击遮罩层是否关闭对话框
    title: title,
    contentPadding: const EdgeInsets.all(0),

    /// 取消默认边距
    middleText: middleText,
    confirm: Container(
        height: 50,
        decoration: const BoxDecoration(
          border: Border(top: BorderSide()),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: showCancel
              ? [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(cancelText, style: const TextStyle(color: Colors.black87))),
                  Container(
                    decoration: const BoxDecoration(border: Border(left: BorderSide())),
                  ),
                  TextButton(onPressed: onConfirm, child: Text(confirmText)),
                ]
              : [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(confirmText))
                ],
        )),
  );
}
