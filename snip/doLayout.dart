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
              height: 120,
              child: Text(
                "杯雪",
                style: TextStyle(fontSize: 23),
              )),
          Container(
              color: Colors.green,
              height: 100,
              child: Text(
                "南湖",
                style: TextStyle(fontSize: 35),
              )),
          Container(
              color: Colors.pink,
              height: 80,
              child: Text(
                "夜无烟",
                style: TextStyle(fontSize: 11),
              )),
        ],
      ),
    );
  }
}

//

// TextBaseline.alphabetic, 英文字符

// ideographic, 中文字符
