import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MarketPage extends StatelessWidget {
  final logic = Get.put(MarketLogic()); // 逻辑层
  final state = Get.find<MarketLogic>().state; // 状态(定义所需数据)
  MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置资金安全信息'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 10,
              color: Colors.grey.shade200,
            ),
            Expanded(
                child: Obx(() => Stepper(
                    currentStep: state.currentStep.value,
                    steps: ['身份证信息认证', '设置交易密码', '绑定银行卡']
                        .asMap()
                        .entries
                        .map((e) => Step(
                            isActive: e.key <= state.currentStep.value,
                            title: Text(e.value),
                            state: e.key < state.currentStep.value ? StepState.complete : StepState.indexed,
                            content: Container()))
                        .toList(),
                    controlsBuilder: (BuildContext context, ControlsDetails details) {
                      return Row(mainAxisAlignment: state.currentStep.value != 0 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end, children: [
                        if (state.currentStep.value != 0) TextButton(onPressed: details.onStepCancel, child: const Text('上一步')),
                        TextButton(onPressed: details.onStepContinue, child: const Text('下一步'))
                      ]);
                    },
                    onStepTapped: logic.onStepTapped,
                    onStepCancel: logic.onStepCancel,
                    onStepContinue: logic.onStepContinue)))
          ],
        ),
      ),
    );
  }
}
