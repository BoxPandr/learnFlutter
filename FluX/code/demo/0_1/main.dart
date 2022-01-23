import 'package:flutter/cupertino.dart';
// 相当于  UIKit
import 'package:flutter/material.dart';

// 声明式 UI 的语法

// 所见，即所得

void main() => runApp(ViewA());

class ViewA extends StatelessWidget {
  // 快捷修复, 警告
  // 选中
  // alt + enter

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "666 dng 666   666 ",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

// Center， 是布局的 Widget

}

// 两种基础的 Widget

// 无状态的， StatelessWidget

// 和有状态的
