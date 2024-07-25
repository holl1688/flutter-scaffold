import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PersonalLogic());
    final state = logic.state;

    return GetBuilder<PersonalLogic>(builder: (logic) {
      return Scaffold(
          body: Stack(
        children: [
          /// 去除边距组件
          MediaQuery.removePadding(
              removeTop: true, // 去除上边距(安全区)
              context: context,

              /// 监听内容滚动部件
              child: NotificationListener(
                  onNotification: (scrollNotification) {
                    /// 判断滚动是否大于0 && 是否第一层部件滚动
                    if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                      logic.onScroll(scrollNotification.metrics.pixels); // 触发滚动事件(自定义)
                      return false;
                    }
                    return true;
                  },
                  child: ListView(children: <Widget>[
                    Container(
                        height: 260,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,

                                /// 渐变开始位置
                                end: Alignment.topRight,

                                /// 渐变结束位置
                                colors: [
                              /// 具体颜色
                              Color(0xFFFF7D75),
                              Color(0xFFFFA463),
                            ],
                                stops: [
                              -0.73,
                              1.0107
                            ]

                                /// 结束点
                                )),
                        child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('我的', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/personal/customerIcon.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                      const SizedBox(width: 10),
                                      Image.asset('assets/icons/personal/chatIcon.png', width: 20, height: 20)
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Container(
                                    height: 70.0,
                                    width: 70.0,
                                    margin: const EdgeInsets.only(right: 15.0),
                                    child: const CircleAvatar(
                                        backgroundImage:
                                            NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5oSxm3IhiX7VwmnVo01urvZ7hNlP1M6YVtZiiRDU&s')),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('586683213', style: TextStyle(color: Colors.white)),
                                      Row(
                                        children: [
                                          const Text('邀请码: ', style: TextStyle(color: Colors.white)),
                                          Image.asset('assets/icons/personal/copyDuplicate.png', width: 16, height: 16)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset('assets/icons/personal/phoneSuccess_b.png', width: 16, height: 16),
                                          Image.asset('assets/icons/personal/contacts_b.png', width: 16, height: 16),
                                          Image.asset('assets/icons/personal/bankCard_b.png', width: 16, height: 16),
                                          Image.asset('assets/icons/personal/mailSend_b.png', width: 16, height: 16)
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ]))),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(),
                        Positioned(
                            width: MediaQuery.of(context).size.width,
                            top: -100,
                            child: Column(
                              children: [
                                Card(
                                    surfaceTintColor: Colors.white,
                                    elevation: 8,
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Text('总资产', style: TextStyle(fontSize: 18)),
                                                  const SizedBox(width: 14),
                                                  const Text('CNY', style: TextStyle(fontSize: 18, color: Color(0xFF7A7A7A))),
                                                  const SizedBox(width: 2),
                                                  Image.asset('assets/icons/eyeClose.png', width: 20, height: 20)
                                                ],
                                              ),
                                              Image.asset('assets/icons/personal/infoIcon.png', width: 26, height: 26)
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('¥ ' + '0', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                                              Row(
                                                children: [
                                                  Image.asset('assets/icons/personal/percentIcon.png', width: 26, height: 26),
                                                  const SizedBox(width: 8),
                                                  const Text('持仓盈亏')
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          const Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text('账户余额', style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A))),
                                                    Text('0', style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A)))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text('合约价值', style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A))),
                                                    Text('0', style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A)))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text('现金券', style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A))),
                                                    Text('0', style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A)))
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text('利息券', style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A))),
                                                    Text('0', style: TextStyle(fontSize: 16, color: Color(0xFF7A7A7A)))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ))
                      ],
                    ),
                    Card(
                        elevation: 8,
                        surfaceTintColor: Colors.white,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        margin: const EdgeInsets.fromLTRB(10, 94, 10, 20),
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [Image.asset('assets/icons/personal/rechargeIcon.png', width: 40, height: 40), Text('充值')],
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: [Image.asset('assets/icons/personal/withDrawIcon.png', width: 40, height: 40), Text('提现')],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [Image.asset('assets/icons/personal/agentIcon.png', width: 40, height: 40), Text('代理中心')],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [Image.asset('assets/icons/personal/fundingIcon.png', width: 40, height: 40), Text('资金明细')],
                                  ),
                                )
                              ],
                            ))),
                    Card(
                        elevation: 8,
                        surfaceTintColor: Colors.white,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.snackbar('SnackBar', '这是GetX的SnackBar');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset('assets/icons/personal/signIcon.png', width: 17, height: 17),
                                      const SizedBox(width: 5),
                                      const Expanded(child: Text('每日签到')),
                                      Image.asset('assets/icons/personal/goIcon.png', height: 17),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/icons/personal/taskIcon.png', width: 17, height: 17),
                                    const SizedBox(width: 5),
                                    const Expanded(child: Text('任务中心')),
                                    Image.asset('assets/icons/personal/goIcon.png', height: 17),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/icons/personal/activeIcon.png', width: 17, height: 17),
                                    const SizedBox(width: 5),
                                    const Expanded(child: Text('活动中心')),
                                    Image.asset('assets/icons/personal/goIcon.png', height: 17),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                    Card(
                        elevation: 8,
                        surfaceTintColor: Colors.white,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    Get.toNamed('security');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset('assets/icons/personal/lookIcon.png', width: 17, height: 17),
                                      const SizedBox(width: 5),
                                      const Expanded(child: Text('账号与安全')),
                                      Image.asset('assets/icons/personal/goIcon.png', height: 17),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/icons/personal/helpIcon.png', width: 17, height: 17),
                                    const SizedBox(width: 5),
                                    const Expanded(child: Text('帮助中心')),
                                    Image.asset('assets/icons/personal/goIcon.png', height: 17),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.13)))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/icons/personal/settingIcon.png', width: 17, height: 17),
                                    const SizedBox(width: 5),
                                    const Expanded(child: Text('通用设置')),
                                    Image.asset('assets/icons/personal/goIcon.png', height: 17),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 10, top: 10),
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset('assets/icons/personal/myIcon.png', width: 17, height: 17),
                                      const SizedBox(width: 5),
                                      const Expanded(child: Text('关于')),
                                      Image.asset('assets/icons/personal/goIcon.png', height: 17),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                  ]))),
          Opacity(
              opacity: state.appBarAlpha,
              child: Column(
                children: [AppBar(centerTitle: true, title: const Text('个人中心'))],
              ))
        ],
      ));
    });
  }
}
