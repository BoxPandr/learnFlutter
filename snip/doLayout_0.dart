import 'package:flutter/material.dart';

class LayoutIt extends StatelessWidget {
  const LayoutIt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment(0, 0),
      child: Row(
        children: <Widget>[
          Container(
              color: Colors.white,
              child: Icon(
                Icons.more,
                size: 60,
              )),
          Container(
              color: Colors.green,
              child: Icon(
                Icons.add,
                size: 60,
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
