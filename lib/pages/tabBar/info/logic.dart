import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class NestedScrollLogic extends GetxController with GetSingleTickerProviderStateMixin, WidgetsBindingObserver {
  OverlayState? overlayState;
  NestedScrollLogic(this.overlayState);

  final state = NestedScrollState();
  final context = Get.context!;
  final nestedScrollController = ScrollController(); // 整页滚动控制器(几乎没啥用)
  final key = GlobalKey();
  final focusNode = FocusNode();
  final globalKey = GlobalKey();

  late OverlayEntry overlayEntry;
  late TabController tabController;
  RenderBox? renderBox;

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addObserver(this); // 添加观察者以便监听各种状态变化

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
    });

    /// 监听输入框焦点变化
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        overlayEntry = createOverlayEntry();
        overlayState?.insert(overlayEntry);
      } else {
        overlayEntry.remove();
        overlayEntry = createOverlayEntry();
      }
    });

    state.tabNameList.value = ['POPULAR'];
    state.tabNameList.addAll(state.sortNameList);
    state.tabNameList.add('FAVORITE');
    state.tabs.addAll(state.tabNameList);
    tabController = TabController(vsync: this, length: state.tabs.length);
  }

  /// 监听屏幕尺寸变化
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    // 这里处理屏幕尺寸变化的逻辑，例如键盘弹出或屏幕旋转
    print("屏幕尺寸变化了, ${renderBox?.size}");
    focusNode.unfocus();
  }

  /// 导航标签点击事件
  tabBarHandle(int index) {
    Scrollable.ensureVisible(key.currentContext!, duration: Duration.zero, curve: Curves.linear, alignment: 0.0);
  }

  /// 创建 overlay 浮空内容实例
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
                  children: const <Widget>[
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
