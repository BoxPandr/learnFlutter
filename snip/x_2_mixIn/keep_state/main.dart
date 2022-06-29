import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Pages/friends_page.dart';
import 'Pages/one_chat.dart';
import 'Pages/page_mine.dart';
import 'Pages/two_discover.dart';
import 'models/Men.dart';

info(String aa) {
  //  print(Isolate.current.debugName);
}

ccc() {
  Future(() => compute(info, "11")).then((value) => print(11));
  Future(() => compute(info, "11")).then((value) => print(22));
  Future(() => compute(info, "11")).then((value) => print(33));
  Future(() => compute(info, "11")).then((value) => print(44));
  Future(() => compute(info, "11")).then((value) => print(55));
}

Future haha() {
  return Future(() {
    // print(Isolate.current.debugName);
    compute(info, "11");
  });
}

Future wanwan() {
  return Future(() {
    return compute(info, "11");
  });
}

ddd() {
  haha().then((value) => print(11));
  haha().then((value) => print(22));
  haha().then((value) => print(33));
  haha().then((value) => print(44));
  haha().then((value) => print(55));
}

fff() {
  wanwan().then((value) {
    print(11);
  });
  wanwan().then((value) => print(22));
  wanwan().then((value) => print(33));
  wanwan().then((value) => print(44));
  wanwan().then((value) => print(55));
}

void showProgress(int count, int total) {
  if (total > 1) {
    print(" 下载了   " +
        (100 * (count + 0.0) / (total + 0.0)).toStringAsFixed(0) +
        " %");
  }
}

void main() {
  fff();
  Men little = Men("加油 ", "  冲啊");
  little = Men.fromArr(["111", "go"]);
  print('' + little.name + '/n/n url ' + little.img);

  runApp(MaterialApp(
    showSemanticsDebugger: false,
    theme: ThemeData(
        primaryColor: Colors.blue,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        cardColor: Colors.black),
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}

class App extends StatelessWidget {
  // 方法前，+ _, 说明是私有方法

  @override
  Widget build(BuildContext context) {
    return PageFirst();
  }
}

// iOS ， 原点在左上角

// flutter, 原点在中心点

class PageFirst extends StatefulWidget {
  const PageFirst({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<PageFirst> {
  int currentIndex = 0;

  // Widget 不存在于渲染树中，就会被销毁

  // 尽管数据持有 ( 数据在内存中 )，widget 不处于渲染树中，widget 相当于被释放了

  // Flutter 的渲染逻辑，内存里面的 widget，上界面，就得重新渲染。

  // Flutter， 高性能的渲染： 一般，不显示在界面上的 Widget, 会被释放，不会被保留

  // Flutter 是，单页面的

  List<Widget> all = [ChatPage(), DiscoverPage(), Pals(), PageMine()];

  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: all,
          controller: _pageController,
        ),
        backgroundColor: Colors.grey[80],
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 12,
            onTap: (val) {
              setState(() {
                currentIndex = val;
              });
              _pageController.jumpToPage(val);
            },
            currentIndex: currentIndex,
            fixedColor: Colors.red,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset("images/tabbar_chat.png",
                    width: 20, height: 20),
                activeIcon: Image.asset("images/tabbar_chat_hl.png",
                    width: 20, height: 20),
                label: "微信",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: "通讯录",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bubble_chart),
                label: "发现",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                label: "我的",
              ),
            ]));
  }
}
