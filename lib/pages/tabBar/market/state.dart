import 'package:get/get.dart';

class MarketState {
  late RxInt currentStep;

  MarketState() {
    currentStep = 0.obs;
  }
}
