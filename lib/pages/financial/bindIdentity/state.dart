import 'dart:typed_data';
import 'package:get/get.dart';

import '../../../widget/SinglePicker.dart';

class BindIdentityState {
  late RxInt gender;
  late RxString country;
  late RxBool promise;
  late RxString idType;
  late RxString birthArea;
  late Rx<Uint8List?> frontImage;
  late RxString backImagePath;
  late RxList<Option> countryOption;


  BindIdentityState() {
    gender = RxInt(0);
    country = RxString('中国');
    promise = RxBool(false);
    idType = '中国永久性居民身份证'.obs;
    birthArea = '中国香港'.obs;
    frontImage = Rx<Uint8List?>(null);
    backImagePath = ''.obs;
    countryOption = [Option(label: '中国', value: 1)].obs;
  }
}
