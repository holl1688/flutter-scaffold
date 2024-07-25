import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // 选择器依赖

class SinglePicker{
  static Future<int?> showPicker({
    required BuildContext context,
    required List<Option> options,
    int value = 0,
    double itemExtent = 32,
    double height = 300
  }) {
    return showCupertinoModalPopup<int>( // 选择器弹窗
        context: context,
        builder: (BuildContext context){
          var controller = FixedExtentScrollController(initialItem: value); // 定义选择器控制器
          return Container(
              color: Colors.grey.shade200,
              height: height,
              child:Column(
                  children: [
                    SizedBox(
                        height: 40.0,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context); // 使用路由返回,即关闭且不传参
                                },
                                child:const Text('取消'),
                              ),
                              TextButton(
                                onPressed: (){
                                  Navigator.pop(context,controller.selectedItem); // 使用路由返回,即关闭并传参
                                },
                                child:const Text('确定'),
                              )
                            ]
                        )
                    ),
                    Expanded(child: CupertinoPicker(
                      scrollController: controller, // 选择器控制器
                      squeeze: 1.2,
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      itemExtent: itemExtent, // 选择元素高度
                      onSelectedItemChanged: (val){},
                      selectionOverlay: IgnorePointer(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 0.0, color: Colors.black12),
                                bottom: BorderSide(width: 0.0, color: Colors.black12)
                              )
                            ),
                            constraints: BoxConstraints.expand(
                              height: itemExtent
                            ),
                          )
                        )
                      ),
                      children: options.map((item) => Center(child: Text(item.label))).toList(), // 选择元素列表
                    ))
                  ]
              )
          );
        }
    );
  }
}

class Option{
  final dynamic label;
  final dynamic value;

  const Option ({ required this.label, required this.value });
}