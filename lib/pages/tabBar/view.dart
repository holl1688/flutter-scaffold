import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/pages/tabBar/personal/view.dart';
import '/pages/tabBar/profile/view.dart';
import '/pages/tabBar/market/view.dart';
import '/pages/tabBar/info/view.dart';
import '/pages/tabBar/home/view.dart';
import '/common/key.dart';

/// overlay 状态
OverlayState? overlayState;

/// 底部导航栏页面
List<Widget> tabViewList = [HomePage(), MarketPage(), NestedScrollPage(overlayState), ProfilePage(), const PersonalPage()];

/// 定义首页(有状态)
class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

/// 首页构建
class _TabBarPageState extends State<TabBarPage> {
  int _selectedIndex = 0; // 选中的底部导航栏下标
  /// 点击导航栏触发的方法
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// 生命周期: 初始化阶段
  @override
  void initState() {
    super.initState();

    /// 获取Get路由跳转时传递的参数
    if (Get.arguments != null && Get.arguments is int) {
      _selectedIndex = Get.arguments;
    }

    overlayState = Overlay.of(context); // 获取 overlay 状态
  }

  /// 生命周期: 销毁阶段
  @override
  void dispose() {
    super.dispose();

    overlayState?.dispose(); // 销毁
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4),
          child: Scaffold(
            appBar: AppBar(foregroundColor: Colors.transparent, elevation: 0.0),
            body: ListView(
              addAutomaticKeepAlives: false,
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: const Text('返回'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        /// 原生底部导航栏
        items: barItemList,

        /// 导航栏元素
        currentIndex: _selectedIndex,

        /// 当前选中项
        selectedItemColor: const Color.fromRGBO(255, 94, 0, 1),

        /// 选中项颜色
        type: BottomNavigationBarType.fixed,

        /// 导航栏类型(显示label)
        onTap: _onItemTapped,

        /// 点击事件
      ),
      body: IndexedStack(index: _selectedIndex, children: tabViewList),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        mini: true,
        shape: StadiumBorder(side: BorderSide(style: BorderStyle.solid, color: Colors.blue.shade500)),
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

/// 底部导航栏元素列表
List<BottomNavigationBarItem> barItemList = [
  const BottomNavigationBarItem(
      label: '自选',

      /// 标签名
      icon: Icon(Icons.favorite_outline),

      /// 标签图标(非活动)
      tooltip: '首页',

      /// 长按说明
      activeIcon: Icon(Icons.favorite)

      /// 标签图标(活动)
      ),
  BottomNavigationBarItem(
    label: '市场',

    /// 标签名
    icon: SvgPicture.asset(
      /// 标签图标(非活动)
      'assets/svg/earth-outline.svg',
      width: 20,
      // ignore: deprecated_member_use
      color: const Color.fromRGBO(117, 115, 117, 1),
    ),
    activeIcon: SvgPicture.asset(
      /// 标签图标(活动)
      'assets/svg/earth.svg',
      width: 20,
      // ignore: deprecated_member_use
      color: const Color.fromRGBO(255, 94, 0, 1),
    ),
  ),
  BottomNavigationBarItem(
      label: '交易',

      /// 标签名
      icon: Stack(
        /// 标签图标(非活动+活动)
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.feed),
          Positioned(
              top: -6.0,
              right: -10.0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                constraints: const BoxConstraints(
                  minWidth: 12,
                  minHeight: 12,
                ),
                child: const Text('101',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center),
              ))
        ],
      ),
      activeIcon: Stack(clipBehavior: Clip.none, children: <Widget>[
        const Icon(Icons.feed),
        Positioned(
          // draw a red marble
          top: -6.0,
          right: -10.0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 12,
              minHeight: 12,
            ),
            child: const Text(
              '101',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ])),
  const BottomNavigationBarItem(
      label: '合约',

      /// 标签名
      icon: Icon(Icons.work_outline),

      /// 标签图标(非活动)
      activeIcon: Icon(Icons.work)

      /// 标签图标(活动)
      ),
  const BottomNavigationBarItem(
      label: '我的',

      /// 标签名
      icon: Icon(Icons.person_outlined),

      /// 标签图标(非活动)
      tooltip: '个人信息',

      /// 长按说明
      activeIcon: Icon(Icons.person)

      /// 标签图标(活动)
      ),
];
