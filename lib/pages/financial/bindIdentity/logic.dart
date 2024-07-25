import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'state.dart';

class BindIdentityLogic extends GetxController {
  final BindIdentityState state = BindIdentityState();

  Future<void> pickImage(bool isFront) async {
    final ImagePicker picker = ImagePicker();
    final xFile = await picker.pickImage(source: ImageSource.gallery);
    if (xFile != null && isFront) {
      xFile.readAsBytes().then((value) {
        state.frontImage.value = value;
      });
    } else if (xFile != null && !isFront) {
      state.backImagePath.value = xFile.path;
    }
  }
}
