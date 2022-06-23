import 'package:flutter/material.dart';

class LayoutIt extends StatelessWidget {
  const LayoutIt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment(0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // center
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          Container(
              color: Colors.white,
              child: Icon(
                Icons.more,
                size: 130,
              )),
          Container(
              color: Colors.green,
              child: Icon(
                Icons.add,
                size: 120,
              )),
          Container(
              color: Colors.pink,
              child: Icon(
                Icons.home,
                size: 60,
              )),
        ],
      ),
    );
  }
}

// MainAxisAlignment.spaceAround,

// 剩下的空间，平均分布到小部件的周围

// 3 个子控件， 间隔 1221

//

//

// MainAxisAlignment.spaceBetween,

// 剩下的空间，平均分布到小部件之间

// 3 个子控件， 间隔 33

// 左边和右边，没有的

//

//

// spaceEvenly

// 剩下的空间，和小部件一起，平均分布

// 3 个子控件， 间隔 1111

//

//

// 主轴，和交叉轴

// 交叉轴, 垂直于主轴

//

//

// CrossAxisAlignment.start

// CrossAxisAlignment.end,

// CrossAxisAlignment.center

//

//

//

// crossAxisAlignment: CrossAxisAlignment.baseline,

// textBaseline: TextBaseline.alphabetic,

// baseline， 配合 textBaseline

//

//

//

// TextBaseline.alphabetic, 英文字符

// ideographic, 中文字符
