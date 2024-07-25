import 'package:flutter/material.dart';

class KeepAliveWidget extends StatefulWidget {
  final Widget item;

  const KeepAliveWidget({super.key, required this.item});

  @override
  State<KeepAliveWidget> createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return widget.item;
  }
}
