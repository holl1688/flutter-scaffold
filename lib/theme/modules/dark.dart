import 'package:flutter/material.dart';

final Map<String, ThemeData> dark = {
  'dark': ThemeData.dark().copyWith(
    /// 重写暗色主题
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.black,
    indicatorColor: const Color(0xFF1C2334),
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF101629)),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Color(0xFF101629)),
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          secondary: Colors.yellow,
        ),
  ),
};
