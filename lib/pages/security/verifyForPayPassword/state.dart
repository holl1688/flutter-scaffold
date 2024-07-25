import 'package:flutter/material.dart';

class VerifyForPayPasswordState {
  late BuildContext? context;
  late String code;

  late FocusNode focus1;
  late TextEditingController inputController1;
  late String inputWord1;

  late FocusNode focus2;
  late TextEditingController inputController2;
  late String inputWord2;

  late FocusNode focus3;
  late TextEditingController inputController3;
  late String inputWord3;

  late FocusNode focus4;
  late TextEditingController inputController4;
  late String inputWord4;

  late FocusNode focus5;
  late TextEditingController inputController5;
  late String inputWord5;

  late FocusNode focus6;
  late TextEditingController inputController6;
  late String inputWord6;

  VerifyForPayPasswordState() {
    context = null;
    code = '';

    inputWord1 = '';
    focus1 = FocusNode();
    inputController1 = TextEditingController(text:inputWord1);

    inputWord2 = '';
    focus2 = FocusNode();
    inputController2 = TextEditingController(text:inputWord2);

    inputWord3 = '';
    focus3 = FocusNode();
    inputController3 = TextEditingController(text:inputWord3);

    inputWord4 = '';
    focus4 = FocusNode();
    inputController4 = TextEditingController(text:inputWord4);

    inputWord5 = '';
    focus5 = FocusNode();
    inputController5 = TextEditingController(text:inputWord5);

    inputWord6 = '';
    focus6 = FocusNode();
    inputController6 = TextEditingController(text:inputWord6);
  }
}
