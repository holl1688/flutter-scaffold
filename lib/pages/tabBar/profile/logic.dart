import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';
import 'dart:math';

class ProfileLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final state = ProfileState();

  final focusNode = FocusNode(); // 输入框聚焦
  final globalKey = GlobalKey(); // 定义全局唯key(bulid时绑定,即bulid完成后才能调用到)

  late TabController tabController; // 标签控制器
  late BuildContext context; // 上下文
  late RenderBox? renderBox; // 定义需要获取位置的对象
  late OverlayEntry overlayEntry; // 定义一个浮层实例(用于输入框提示)

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: state.tabs.length)

      /// 初始化标签控制器
      ..addListener(() {
        if (tabController.index.toDouble() == tabController.animation?.value) {
          state.currentTab = tabController.index;
          update();
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /// 监听build完成回调
      renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;

      /// 为需要获取位置的对象绑定值(globalKey需要build完成才能获取)
      overlayEntry = createOverlayEntry();
    });
    focusNode.addListener(() {
      /// 监听输入框聚焦
      if (focusNode.hasFocus) {
        state.overlayState?.insert(overlayEntry);
      } else {
        overlayEntry.remove();
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    context = Get.overlayContext!;
    state.overlayState = Overlay.of(context);

    /// 获取 overlay 状态

    super.onReady();
  }

  // 随机位置显示层
  void showRandomOverlay() {
    // 随机颜色
    final bgColor = Color.fromARGB(
      255,
      1 + Random().nextInt(254),
      1 + Random().nextInt(254),
      1 + Random().nextInt(254),
    );

    // 屏幕宽度
    final screenWidth = MediaQuery.of(context).size.width;

    // 随机屏幕高度
    final randomHeight = MediaQuery.of(context).size.height * Random().nextDouble();

    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        // 指定位置
        left: 0,
        top: randomHeight,
        child: GestureDetector(
          // 点击删除
          onTap: () {
            overlayEntry?.remove();
            state.entriesList.remove(overlayEntry);
          },
          // 背景随机色
          child: Container(
            width: screenWidth,
            height: 100,
            color: bgColor,
            child: Center(
              // 提示文字
              child: Text(
                "这是一个 overlay ${Random().nextInt(100)} 层, 点击关闭",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      );
    });
    state.overlayState?.insert(overlayEntry);
    state.entriesList.add(overlayEntry);
  }

  /// 创建浮层
  OverlayEntry createOverlayEntry() {
    var size = renderBox?.size;
    var offset = renderBox?.localToGlobal(Offset.zero);
    return OverlayEntry(
        builder: (context) => Positioned(
              left: offset?.dx,
              top: offset!.dy + size!.height + 5.0,
              width: size.width,
              child: Material(
                elevation: 4.0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      title: Text('Syria'),
                    ),
                    ListTile(
                      title: Text('Lebanon'),
                    )
                  ],
                ),
              ),
            ));
  }
}
