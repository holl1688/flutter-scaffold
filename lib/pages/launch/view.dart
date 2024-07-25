import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '/storage/index.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  final maxWidth = kIsWeb ? 486.0 : double.infinity;

  void startHandle() {
    final token = Storage.getString(StorageKeys.token);
    if (token == null || token.isEmpty) {
      Get.offAllNamed('login');
    } else {
      Get.offAllNamed('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        color: const Color(0xFF090F1F),
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(alignment: Alignment.topLeft, repeat: ImageRepeat.repeat, image: AssetImage("assets/icons/texture_bg.png")),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 40),
                ),
                ElevatedButton(onPressed: startHandle, child: const Text('确认')),
              ],
            )),
      ),
    )));
  }
}
