import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Cells/DiscoverCell.dart';

class PageMine extends StatefulWidget {
  const PageMine({Key? key}) : super(key: key);

  @override
  _PageMineState createState() => _PageMineState();
}

class _PageMineState extends State<PageMine> {
  ImageProvider _avatar = AssetImage("images/Hank.png");
  MethodChannel _channel = MethodChannel("_PageMineState");

  Widget header() {
    return Container(
      height: 200,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _channel.invokeMapMethod("pic");
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.33,
              height: 100,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: DecorationImage(image: _avatar, fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
                color: Colors.transparent,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.67 - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "666",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      backgroundColor: Colors.green),
                ),
                Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "微信111111111111111",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      Image.asset("images/icon_right.png", width: 15),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  initState() {
    super.initState();
    _channel.setMethodCallHandler(invokedMethods);
  }

  Future<dynamic> invokedMethods(MethodCall methodCall) async {
    switch (methodCall.method) {
      case "imgPath":
        String path = methodCall.arguments.toString();
        print("arrived to open caller" + path);
        setState(() {
          _avatar = FileImage(File(path));
        });

      // Navigator.pushNamed(context, "/ring");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(220, 220, 220, 1),
            child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: <Widget>[
                    header(),
                    DiscoverItem("摇一摇", "images/摇一摇.png", "", ""),
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(right: 15, top: 40),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image(
                  image: AssetImage("images/相机.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
