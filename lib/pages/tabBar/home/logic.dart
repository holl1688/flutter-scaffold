import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class TabHomeLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final TabHomeState state = TabHomeState(); // 引入GetX状态类(变量集合)

  final ScrollController customScrollController = ScrollController(); // 自定义滚动视图控制器

  List<GlobalKey> globalKeys = [];
  final GlobalKey tabBarKey = GlobalKey(); // 导航标签key(用于获取高度)
  final double appBarHeight = AppBar().preferredSize.height; // 顶部导航栏高度
  late double screenHeight; // 屏幕高度
  late double statusHeight; // 状态栏高度
  late double tabBarHeight; // 导航标签高度
  late TabController tabController; // 导航标签控制器
  late List<RenderBox> renderBoxList = []; // 定位列表实例合集
  bool tabClick = false; // 判断是否导航标签点击事件

  @override
  void onInit() {
    /// 生命周期--初始化
    super.onInit();

    state.tabNameList.value = ['POPULAR']; // 导航标签名称赋初始值
    state.tabNameList.addAll(state.sortNameList); // 添加游戏分类名称
    state.tabNameList.add('FAVORITE'); // 最后添加收藏名称
    state.tabs.value = state.tabNameList.map((tab) => customTab(tab)).toList(); // 根据名称生成导航栏部件列表
    tabController = TabController(vsync: this, length: state.tabs.length); // 定义导航栏控制器
    globalKeys = List.generate(state.tabs.length, (index) => GlobalKey()); // 生成全局key列表

    customScrollController.addListener(() {
      // 开启滚动监听
      // final scrollSite = customScrollController.position.pixels;         // 获取页面滚动位置
      for (int i = renderBoxList.length - 1; i >= 0; i--) {
        // 遍历定位部件实例(从后往前遍历)
        Offset local = renderBoxList[i].localToGlobal(Offset.zero); // 获取部件相对于屏幕顶部位置
        if (local.dy < statusHeight + appBarHeight + tabBarHeight + 5.0) {
          // 判断当前位置是否在到达或超过导航标签底部(状态栏+顶部导航栏+导航标签+预留高度)
          if (tabController.index != i && !tabClick) {
            // 如果当前位置到达或超过导航标签底部并且导航标签当前序号不等于当前监听部件的序号且不是导航栏点击事件而滚动
            tabController.index = i;
          }
          break;
        }
      }
    });
  }

  /// 导航标签点击事件
  tabBarHandle(int index) {
    tabClick = true; // 设置导航栏点击事件状态
    Scrollable.ensureVisible(
        // 页面滚动到指定的部件
        globalKeys[index].currentContext!, // 指定部件的上下文
        duration: const Duration(milliseconds: 300), // 滚动过渡时间
        curve: Curves.linear, // 过渡动画曲线
        alignment: 0.0 // 指定的部件位于屏幕的位置<百分比>
        );
    Timer(const Duration(milliseconds: 400), () {
      // 滚动结束还原导航栏点击事件状态
      tabClick = false;
    });
  }
}

/// 自定义导航按钮
Widget customTab(String label) {
  return Tab(
    iconMargin: EdgeInsets.zero,
    icon: Image.asset('assets/icons/sort/${label}_on.png', width: 40, height: 40),
    child: SizedBox(
      // width: 60,
      child: Center(child: Text(label, style: const TextStyle(fontSize: 12))),
    ),
  );
}
