import 'package:flutter/cupertino.dart';
// 相当于  UIKit
import 'package:flutter/material.dart';

// 声明式 UI 的语法

// 所见，即所得

void main() => runApp(AppDeng());

class AppDeng extends StatelessWidget {
  const AppDeng({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Deng"),
        ),
        body: ViewA(),
      ),
      theme: ThemeData(primaryColor: Colors.yellow),
    );
  }
}

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
          color: Colors.red,
        ),
      ),
    );
  }

// Center， 是布局的 Widget

}
