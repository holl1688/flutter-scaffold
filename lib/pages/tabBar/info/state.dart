import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NestedScrollState {
  late RxString title;
  late RxList<String> tabs;
  late RxList<String> tabNameList;
  late RxInt currentTab;
  late RxList<String> swiperList;
  late RxList<dynamic> popularList;
  late RxList<String> sortNameList;
  late RxList<GlobalKey> globalKeys;
  late RxList<RenderBox> renderBoxList;

  NestedScrollState() {
    title = '首页'.obs;
    tabs = <String>[].obs;
    currentTab = 0.obs;
    swiperList = [
      'https://e8vhdh-147.s3.ap-east-1.amazonaws.com/cocos/channel/img_dt2_banner_b2.png',
      'https://e8vhdh-147.s3.ap-east-1.amazonaws.com/cocos/channel/img_dt2_banner_b4.png'
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
    sortNameList = ['SORT1', 'SORT3', 'SORT4', 'SORT5', 'SORT6', 'SORT7'].obs;
    tabNameList = <String>[].obs;
    globalKeys = <GlobalKey>[].obs;
    renderBoxList = <RenderBox>[].obs;
  }
}
