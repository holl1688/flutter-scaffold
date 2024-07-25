import 'package:get/get.dart';

class AddWithdrawAccountState {
  late RxInt currentStep;

  AddWithdrawAccountState() {
    currentStep = 0.obs;
  }
}
