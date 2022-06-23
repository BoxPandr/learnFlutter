import 'package:flutter/material.dart';

import 'Cells/DiscoverCell.dart';

class DiscoverPage extends StatefulWidget {
  Color _themeColor = Color.fromRGBO(220, 220, 220, 1.0);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 为了 Android
        backgroundColor: widget._themeColor,
        title: Text("Two"),
        elevation: 0.0,
      ),
      body: Container(
        color: widget._themeColor,
        height: 800,
        child: ListView(
          children: <Widget>[
            DiscoverItem("朋友圈", "images/朋友圈.png", "", ""),
            SizedBox(
              height: 10,
            ),
            DiscoverItem("扫一扫", "images/扫一扫.png", "", ""),
            Row(
              // 分割线
              children: <Widget>[
                Container(
                  width: 50,
                  height: 2,
                  color: Colors.white,
                ),
                Expanded(
                    // 不给 里面的 container 宽度，就用 expanded
                    child: Container(
                  height: 2,
                  color: Colors.green,
                ))
              ],
            ),
            DiscoverItem("摇一摇", "images/摇一摇.png", "", ""),
            Container(
              height: 2,
              color: Colors.green,
              width: 50,
            ),
            DiscoverItem('购物', 'images/购物.png', '618限时特价', 'images/badge.png'),
          ],
        ),
      ),
    );
  }
}
