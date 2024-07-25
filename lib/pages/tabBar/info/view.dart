import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';
import 'state.dart';

class NestedScrollPage extends StatelessWidget {
  final OverlayState? overlayState;
  late final NestedScrollLogic logic;
  late final NestedScrollState state;

  NestedScrollPage(this.overlayState, {super.key}) {
    logic = Get.put(NestedScrollLogic(overlayState));
    state = Get.find<NestedScrollLogic>().state;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('导航栏'),
        ),
        body: NestedScrollView(
          controller: PrimaryScrollController.of(context), // 整页滚动控制器(几乎没啥用)
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: SizedBox(
                    child: TextFormField(
                  key: logic.globalKey,
                  focusNode: logic.focusNode,
                  decoration: InputDecoration(labelText: '交易'),
                )),
              ),
              Obx(() => SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(TabBar(
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        labelColor: Colors.black,
                        labelPadding: EdgeInsets.zero,
                        unselectedLabelColor: Colors.black26,
                        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: EdgeInsets.zero,
                        indicatorWeight: 1.0,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        controller: logic.tabController,
                        tabs: state.tabs
                            .map((e) => Stack(children: [
                                  e == state.tabs[state.currentTab.value]
                                      ? Positioned(
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                              height: 5, decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFFDF7C3E), Colors.white]))))
                                      : const SizedBox(child: Center(child: Text(''))),
                                  SizedBox(
                                    child: Center(
                                        child: Text(
                                      e,
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  )
                                ]))
                            .toList(),
                        onTap: (i) {
                          state.currentTab.value = i;
                        })),
                  ))
            ];
          },
          body: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollStartNotification) {
                  // 滚动起始回调
                } else if (notification is ScrollUpdateNotification) {
                  // 滚动中实时回调
                  // print(notification.metrics.pixels);
                  return true;
                } else if (notification is ScrollEndNotification) {
                  // 滚动结束回调
                }
                return true;
              },
              child: TabBarView(
                key: logic.key,
                controller: logic.tabController,
                children: state.tabs
                    .asMap()
                    .map((i, element) => MapEntry(
                        i,
                        ListView(
                          key: PageStorageKey('ListView$i'),
                          children: [
                            GridView.count(
                              padding: const EdgeInsets.all(5.0),
                              physics: const NeverScrollableScrollPhysics(), // 禁止GridView滚动
                              shrinkWrap: true,
                              childAspectRatio: .75,
                              crossAxisCount: 3,
                              children: List.generate(state.popularList.length, (index) {
                                return Container(
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                                  clipBehavior: Clip.hardEdge,
                                  child: Stack(fit: StackFit.expand, children: [
                                    Image.network(
                                      'https://img.lovepik.com/free_png/32/65/36/79R58PICFmap3sa09ra37_PIC2018.png_300.png',
                                      fit: BoxFit.fill,
                                      errorBuilder: (context, exception, stackTrace) {
                                        return Image.asset(
                                          'assets/images/sort/POPULAR_on.png',
                                          fit: BoxFit.fill,
                                        );
                                      },
                                    ),
                                  ]),
                                );
                              }),
                            ),
                          ],
                        )))
                    .values
                    .toList()
                    .cast<Widget>(),
              )),
        ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return PreferredSize(
        preferredSize: Size.fromHeight(_tabBar.preferredSize.height),
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Row(children: [IntrinsicWidth(child: _tabBar)]), // 使用Row包裹IntrinsicWidth在包裹TabBar可以让TabBar宽度自适应(会失去滚动功能)
        ));
  }

  // 是否滚动时需要重建(不重建可以提高性能)
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
