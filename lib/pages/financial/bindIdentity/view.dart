import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/SinglePicker.dart';
import 'logic.dart';

class BindIdentityPage extends StatelessWidget {
  BindIdentityPage({Key? key}) : super(key: key);

  final logic = Get.put(BindIdentityLogic());
  final state = Get.find<BindIdentityLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('绑定身份证信息'),
      ),
      body: ListView(
        children: [
          Container(
            height: 10,
            color: Colors.grey.shade200,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('身份信息',style:TextStyle(fontSize:16)),
                SizedBox(height:20),
                Text('性别',style:TextStyle(fontSize:12,color:Colors.grey)),
                Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent, // 点击空白区域也生效
                      onTap: () {
                        state.gender.value = 1;
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: state.gender.value == 1 ? true : false, // 是否选中, agree为全局定义的变量
                            activeColor: Colors.pink, // 选中的颜色
                            onChanged: (val){
                              state.gender.value = 1;
                            }
                          ),
                          Text('男'),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent, // 点击空白区域也生效
                      onTap: () {
                        state.gender.value = 0;
                      },
                      child: Row(
                        children: [
                          Checkbox(
                            value: state.gender.value == 0 ? true : false,  // 是否选中, agree为全局定义的变量
                            activeColor: Colors.pink, // 选中的颜色
                            onChanged: (val){
                              state.gender.value = 0;
                            }
                          ),
                          Text('女')
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height:30),
                Text('国家/地区',style:TextStyle(fontSize:12,color:Colors.grey)),
                SizedBox(height:10),
                GestureDetector(
                  behavior: HitTestBehavior.translucent, // 点击空白区域也生效
                  onTap: () async {
                    final value = await SinglePicker.showPicker(context: context, options: state.countryOption.value);
                    if (value != null) {
                      state.country.value = state.countryOption.value[value].label;
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.country.value),
                      Icon(Icons.expand_more)
                    ]
                  ),
                ),
                Divider(height:20,color:Colors.black12),
                GestureDetector(
                  behavior: HitTestBehavior.translucent, // 点击空白区域也生效
                  onTap: () {
                    state.promise.value = !state.promise.value;
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: state.promise.value, // 是否选中, agree为全局定义的变量
                        activeColor: Colors.pink, // 选中的颜色
                        onChanged: (val){
                          state.promise.value = !state.promise.value;
                        }
                      ),
                      Text('本人是所选国家/地区的永久居民。',style:TextStyle(fontSize:12))
                    ]
                  ),
                ),
                SizedBox(height:30),
                Text('身份证类型',style:TextStyle(fontSize:12,color:Colors.grey)),
                SizedBox(height:10),
                GestureDetector(
                  behavior: HitTestBehavior.translucent, // 点击空白区域也生效
                  onTap: () async {
                    final value = await SinglePicker.showPicker(context: context, options: [Option(label: '中国永久性居民身份证', value: 1)]);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.idType.value),
                      Icon(Icons.expand_more)
                    ]
                  ),
                ),
                Divider(height:20,color:Colors.black12),
                SizedBox(height:30),
                Text('出生地',style:TextStyle(fontSize:12,color:Colors.grey)),
                SizedBox(height:10),
                GestureDetector(
                  behavior: HitTestBehavior.translucent, // 点击空白区域也生效
                  onTap: () async {
                    final value = await SinglePicker.showPicker(context: context, options: [Option(label: '中国香港', value: 1)]);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(state.birthArea.value),
                        Icon(Icons.expand_more)
                      ]
                  ),
                ),
                Divider(height:20,color:Colors.black12),
                SizedBox(height:30),
                Text('手机号',style:TextStyle(fontSize:12,color:Colors.grey)),
                SizedBox(height:10),
                Text('13912345678'),
                Divider(height:20,color:Colors.black12),
                SizedBox(height:30),
                Text('上传永久性居民身份证',style:TextStyle(fontSize:16)),
                SizedBox(height:10),
                Text('1.上传身份证正面(人像面)'),
                SizedBox(height:10),
                Align(
                  child: GestureDetector(
                    onTap: () { logic.pickImage(true); },
                    child: state.frontImage.value != null
                    ? Image.memory(
                      state.frontImage.value!,
                      width: 130,
                      height: 130,
                      fit: BoxFit.fill
                    )
                    : Container(
                      height: 130,
                      width: 260,
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Icon(Icons.add,size:50,color:Color(0xFFF4F4F4)),
                          ),
                        )
                      )
                    ),
                  ),
                ),
                Divider(height:40,color:Colors.black12),
                Text('1.上传身份证反面'),
                SizedBox(height:10),
                Align(
                  child: GestureDetector(
                    onTap: () { logic.pickImage(false); },
                    child: state.backImagePath.value != ''
                    ? (kIsWeb
                      ? Image.network(
                          state.backImagePath.value,
                          width: 130,
                          height: 130,
                          fit: BoxFit.fill  // 填充满宽高
                        )
                      : Image.file(
                          File(state.backImagePath.value),
                          width: 130,
                          height: 130,
                          fit: BoxFit.fill
                        )
                      )
                    : Container(
                      height: 130,
                      width: 260,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Center(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: const Center(
                            child: Icon(Icons.add,size:50,color:Color(0xFFF4F4F4)),
                          ),
                        )
                      )
                    ),
                  ),
                ),
                Divider(height:40,color:Colors.black12),
                SizedBox(height:20),
                Text('填写您的证件信息',style:TextStyle(fontSize:16)),
                SizedBox(height:10),
                Text('证件姓名（中文名字）',style:TextStyle(color:Colors.grey,fontSize:12)),
                TextField(
                  decoration: InputDecoration(
                    hintText: '请输入证件姓名',
                    enabledBorder: UnderlineInputBorder(						// 未输入时边框样式(颜色与弧角), 默认下下边框: UnderlineInputBorder
                      borderSide: BorderSide(color: Colors.black12)
                    ),
                  ),
                ),
                SizedBox(height:30),
                Text('证件号码',style:TextStyle(color:Colors.grey,fontSize:12)),
                TextField(
                  decoration: InputDecoration(
                    hintText: '请输入证件号码',
                    enabledBorder: UnderlineInputBorder(						// 未输入时边框样式(颜色与弧角), 默认下下边框: UnderlineInputBorder
                      borderSide: BorderSide(color: Colors.black12)
                    ),
                  ),
                ),
                SizedBox(height:20),
                GestureDetector(
                  behavior: HitTestBehavior.translucent, // 点击空白区域也生效
                  onTap: () {
                    state.promise.value = !state.promise.value;
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: state.promise.value, // 是否选中, agree为全局定义的变量
                        activeColor: Colors.pink, // 选中的颜色
                        onChanged: (val){
                          state.promise.value = !state.promise.value;
                        }
                      ),
                      Expanded(child: Text('我同意富途证券及其关联方向我提供/发送直接促销推广信息',style:TextStyle(fontSize:12),overflow:TextOverflow.fade))

                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue)
                    ),
                    child: Align(child:Text('提交',style:TextStyle(color:Colors.white)))
                  ),
                )
              ]
            ))
          )
        ]
      )
    );
  }
}
