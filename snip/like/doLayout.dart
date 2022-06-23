import 'package:flutter/material.dart';

class LayoutIt extends StatelessWidget {
  const LayoutIt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment(0, 0),
      child: Row(
        // Column, Stack
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              color: Colors.white,
              child: Icon(
                Icons.more,
                size: 180,
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
