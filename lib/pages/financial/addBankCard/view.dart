import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/SinglePicker.dart';
import 'logic.dart';

class AddBankCardPage extends StatelessWidget {
  AddBankCardPage({Key? key}) : super(key: key);

  final logic = Get.put(AddBankCardLogic());
  final state = Get.find<AddBankCardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('添加银行卡'), centerTitle: true),
        body: ListView(children: [
          Container(
            height: 10,
            color: Colors.grey.shade200,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                final value = await SinglePicker.showPicker(context: context, options: [Option(label: '中国银行', value: 1)]);
                print(value);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20),
                  Expanded(child: Text('银行名称')),
                  Text('请选择银行', style: TextStyle(color: Colors.red)),
                  SizedBox(width: 5),
                  Image.asset('assets/icons/personal/goIcon.png', height: 17),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text('开户银行'),
                  SizedBox(width: 30),
                  Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                    isDense: true,
                    hintText: '请输入银行名称',
                    hintStyle: TextStyle(fontSize: 15),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ))),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text('银行卡号'),
                  SizedBox(width: 30),
                  Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                    isDense: true,
                    hintText: '请输入银行卡号',
                    hintStyle: TextStyle(fontSize: 15),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ))),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text('持卡人姓名'),
                  SizedBox(width: 20),
                  Expanded(
                      child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            isDense: true,
                            hintStyle: TextStyle(fontSize: 15),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ))),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 100, left: 20, right: 20),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(padding: EdgeInsets.symmetric(vertical: 8), child: Text('绑定')),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(const Color(0xffEDFCF5)),
                      backgroundColor: MaterialStateProperty.all(const Color(0xff3278dc)))))
        ]));
  }
}
