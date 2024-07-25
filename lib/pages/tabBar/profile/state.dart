import 'package:flutter/material.dart';

class ProfileState {
  late OverlayState? overlayState;

  /// overlay 状态
  late List<OverlayEntry> entriesList;

  /// 浮层实例列表
  late List<String> tabs;
  late int currentTab;

  ProfileState() {
    overlayState = null;
    entriesList = [];
    tabs = ['随机新增', '随机排序', '关闭所有'];
    currentTab = 0;
  }
}
