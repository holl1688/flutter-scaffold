import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabHomeState {
  late RxList<Widget> tabs; // 导航栏列表
  late RxList<String> tabNameList; // 导航名称列表(用于生成导航栏列表)
  late RxList<String> sortNameList; // 分类名称列表
  late RxList<GlobalKey> globalKeys; // 全局唯一key列表(用于滚动位置)
  late RxList<RenderBox> renderBoxList; // 部件实例列表(用于获取位置)
  late RxList<String> swiperList; // 轮播图
  late RxList<dynamic> popularList; // 热门游戏列表

  TabHomeState() {
    tabs = <Widget>[].obs;
    swiperList = [
      'https://e8vhdh-147.s3.ap-east-1.amazonaws.com/cocos/channel/img_dt2_banner_b2.png',
      'https://i.pinimg.com/736x/ee/e6/f8/eee6f8234756112f7a69775be6adc50a.jpg',
    ].obs;
    popularList = [
      {
        'name': 'Landlord',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Water Margm',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Duo Fu Duo Cai',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Landlord',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Water Margm',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Duo Fu Duo Cai',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Dragon Tiger',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Water Margm',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Duo Fu Duo Cai',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Landlord',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Water Margm',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
      {
        'name': 'Duo Fu Duo Cai',
        'brand': 'WG',
        'icon': '',
        'isFavorite': false,
        'isBest': false,
        'banner': 'https://img.scbao.com/uploads/allimg/120523/189119-12052311512265.jpg'
      },
    ].obs;
    sortNameList = ['FAVORITE', 'FAVORITE', 'FAVORITE', 'FAVORITE', 'FAVORITE', 'FAVORITE'].obs;
    tabNameList = <String>[].obs;
    globalKeys = <GlobalKey>[].obs;
    renderBoxList = <RenderBox>[].obs;
  }
}
