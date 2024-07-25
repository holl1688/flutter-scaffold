import 'package:flutter/material.dart';

final Map<String, ThemeData> purple = {
  'purple': ThemeData(
    /// 自定义主题色
    primaryColor: Colors.purple,
    checkboxTheme: CheckboxThemeData(
        // 复选框主题
        fillColor: MaterialStateColor.resolveWith((states) => Colors.black12),
        shape: const CircleBorder()),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    // 定义亮色主题
    brightness: Brightness.light,
  ),
};
