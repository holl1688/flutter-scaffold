import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/popup/dialog.dart';
import '/popup/loading.dart';
import '/storage/index.dart';
import 'logic.dart';

class SecurityPage extends StatelessWidget {
  SecurityPage({Key? key}) : super(key: key);

  final logic = Get.put(IndexLogic());
  final state = Get.find<IndexLogic>().state;

  /// 登录
  void _logout() async {
    loading();
    try {
      Storage.setString(StorageKeys.token, '');
      Get.offAllNamed('login');
    } catch (error) {
      //
    } finally {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('账号与安全'),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
            height: 10,
            color: Colors.grey.shade200,
          ),
          Card(
              elevation: 8,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          // Get.toNamed('security');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('账号')),
                            Text('586681213'),
                            SizedBox(width: 5),
                            Image.asset('assets/icons/personal/goIcon.png', height: 17),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Get.toNamed('bindIdentity');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('实名认证')),
                            Text('未认证'),
                            SizedBox(width: 5),
                            Image.asset('assets/icons/personal/goIcon.png', height: 17),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('手机号码')),
                          Text('13912345678'),
                          SizedBox(width: 5),
                          Image.asset('assets/icons/personal/lookIcon.png', width: 15, height: 15),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('邮箱')),
                          Text('未设置'),
                          SizedBox(width: 5),
                          Image.asset('assets/icons/personal/goIcon.png', height: 17),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text('密码')),
                          Text('已设置'),
                          SizedBox(width: 5),
                          Image.asset('assets/icons/personal/goIcon.png', height: 17),
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.toNamed('verifyForPayPassword');
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('提现密码')),
                            Text('未设置'),
                            SizedBox(width: 5),
                            Image.asset('assets/icons/personal/goIcon.png', height: 17),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Get.toNamed('addWithdrawMethod');
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(child: Text('提现方式')),
                            Text('未设置'),
                            SizedBox(width: 5),
                            Image.asset('assets/icons/personal/goIcon.png', height: 17),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Card(
              elevation: 8,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
              margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  normalDialog(middleText: '确认退出?', onConfirm: _logout);
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 12, top: 12),
                  child: Center(
                    child: Text('退出登录', style: TextStyle(color: Colors.red)),
                  ),
                ),
              ))
        ]));
  }
}
