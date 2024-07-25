import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';
import '/widget/KeepAliveWidget.dart';

/// 首页视图
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final logic = Get.put(TabHomeLogic());
  final state = Get.find<TabHomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: const Text('首页-自选'),
      ),
      body: CustomScrollView(
        key: const PageStorageKey('CustomScrollView'),
        controller: logic.customScrollController,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150,
              child: Swiper(
                  autoplay: true,
                  itemCount: state.swiperList.length,
                  loop: true,
                  pagination: const SwiperPagination(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  state.swiperList[index],
                                ),
                                fit: BoxFit.fill)));
                  }),
            ),
          ),
          Obx(() => SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(TabBar(
                  key: logic.tabBarKey,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: logic.tabController,
                  isScrollable: true,
                  // labelColor: Colors.black87,
                  unselectedLabelColor: const Color(0xFF566488),
                  indicator: BoxDecoration(color: Theme.of(context).indicatorColor, borderRadius: BorderRadius.circular(10.0)),
                  tabs: state.tabs.value,
                  onTap: logic.tabBarHandle,
                )),
              )),
          Obx(() => SliverToBoxAdapter(
                child: Column(
                    children: List.generate(
                        state.tabs.length,
                        (i) => Column(
                              children: [
                                KeepAliveWidget(item: Text(key: logic.globalKeys[i], '第${i + 1}排')),
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
                                              'assets/icons/sort/POPULAR_on.png',
                                              fit: BoxFit.fill,
                                            );
                                          },
                                        ),
                                      ]),
                                    );
                                  }),
                                ),
                              ],
                            ))),
              ))
        ],
      ),
    );
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
      preferredSize: const Size.fromHeight(200),
      child: Container(color: Theme.of(context).scaffoldBackgroundColor, child: _tabBar),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
