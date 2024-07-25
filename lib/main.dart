import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'pages/launch/view.dart';
import 'router/routes.dart';
import 'storage/index.dart';
import 'common/logic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 确保 Widgets binding 已初始化(shared_preferences 在 Widgets binding 初始化后才能被调用)
  if (kIsWeb) {
    Storage.getInstance();
  } else {
    await Storage.getInstance();
  }
  runApp(MyApp()); // 映射初始页
}

/// 定义入口页(无状态)
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final logic = Get.put(CommonLogic(), permanent: true);
  final state = Get.find<CommonLogic>().state;

  @override
  Widget build(BuildContext context) {
    /// 使用Get库
    return Obx(() => GetMaterialApp(
          title: 'Flutter Demo', // 项目名(web标签名)
          theme: state.currentTheme.value, // 设置主题(使用Obx可动态变更)
          getPages: Routers.getPages, // 路由映射
          home: const LaunchPage(), // 映射首页
        ));
  }
}
