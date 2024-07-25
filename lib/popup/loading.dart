import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future loading() {
  return Get.dialog(
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: CupertinoActivityIndicator(
          color: Colors.blue.shade400,	// 颜色
          radius: 20,										// 大小
        ),
      )
    )
  );
}