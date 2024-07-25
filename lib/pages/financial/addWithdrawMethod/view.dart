import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/popup/dialog.dart';
import 'logic.dart';

class AddWithdrawMethodPage extends StatelessWidget {
  AddWithdrawMethodPage({Key? key}) : super(key: key);

  final logic = Get.put(AddWithdrawMethodLogic());
  final state = Get.find<AddWithdrawMethodLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('添加提款方式'), centerTitle: true),
      body: ListView(
        children: [
          Container(
            height: 10,
            color: Colors.grey.shade200,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // 设置边框圆弧角度
                image: DecorationImage(
                    // 设置图片为背景
                    alignment: Alignment.topLeft, // 左上对齐
                    fit: BoxFit.fitWidth, // 宽度填充满容器
                    image: AssetImage("assets/images/financial/adCardcny.png"))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CNY(人民币)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 20),
                    Text('未添加', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white70))),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.toNamed('addBankCard');
                    },
                    child: Text('添加', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, height: 1.1)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // 设置边框圆弧角度
                image: DecorationImage(
                    // 设置图片为背景
                    alignment: Alignment.topLeft, // 左上对齐
                    fit: BoxFit.fitWidth, // 宽度填充满容器
                    image: AssetImage("assets/images/financial/adCardhkd.png"))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('HKD(港元)-暂无', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 20),
                    Text('未添加', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white70))),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      normalDialog(showCancel: false, middleText: '该功能暂未开放!');
                    },
                    child: Text('添加', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, height: 1.1)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // 设置边框圆弧角度
                image: DecorationImage(
                    // 设置图片为背景
                    alignment: Alignment.topLeft, // 左上对齐
                    fit: BoxFit.fitWidth, // 宽度填充满容器
                    image: AssetImage("assets/images/financial/adCardusd.png"))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('USD(美元)-暂无', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 20),
                    Text('未添加', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white70))),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      normalDialog(showCancel: false, middleText: '该功能暂未开放!');
                    },
                    child: Text('添加', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, height: 1.1)),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // 设置边框圆弧角度
                image: DecorationImage(
                    // 设置图片为背景
                    alignment: Alignment.topLeft, // 左上对齐
                    fit: BoxFit.fitWidth, // 宽度填充满容器
                    image: AssetImage("assets/images/financial/adCardusdt.png"))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('USDT(数字美元)-暂无', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 20),
                    Text('  未添加', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white70))),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      normalDialog(showCancel: false, middleText: '该功能暂未开放!');
                    },
                    child: Text('添加', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18, height: 1.1)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
