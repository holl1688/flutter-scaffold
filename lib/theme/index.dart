import 'package:flutter/material.dart';
import 'modules/purple.dart';
import 'modules/light.dart';
import 'modules/dark.dart';

final Map<String, ThemeData> themes = {
  ...light,
  ...dark,
  ...purple,
};
