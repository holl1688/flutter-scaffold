import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final logic = Get.put(ProfileLogic());
  final state = Get.find<ProfileLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            bottom: TabBar(
          controller: logic.tabController,
          tabs: [
            ElevatedButton(
              onPressed: () => logic.showRandomOverlay(),
              child: const Text("随机新增"),
            ),
            ElevatedButton(
              onPressed: () {
                for (final entry in state.entriesList) {
                  // 从屏幕上移除所有
                  entry.remove();
                }
                Random random = Random(); // 使用Random类创建随机数生成器
                final shuffledEntries = state.entriesList.sublist(0); // 使用List的sublist()方法创建一个新列表
                shuffledEntries.shuffle(random); // 调用List的shuffle()方法随机排序，传入一个随机数生成器
                state.overlayState?.insertAll(shuffledEntries); // 插入界面
              },
              child: const Text("随机排序"),
            ),
            ElevatedButton(
              onPressed: () {
                for (final entry in state.entriesList) {
                  entry.remove();
                }
                state.entriesList = [];
              },
              child: const Text("关闭所有"),
            )
          ],
          // onTap: (i) => { state.currentTab = i },
        )),
        body: TextFormField(
          key: logic.globalKey,
          focusNode: logic.focusNode,
          decoration: const InputDecoration(labelText: '交易'),
        ));
  }
}
