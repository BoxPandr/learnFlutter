import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'Cells/DiscoverCell.dart';

class PageMine extends StatefulWidget {
  const PageMine({Key? key}) : super(key: key);

  @override
  _PageMineState createState() => _PageMineState();
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class _PageMineState extends State<PageMine> {
  ImageProvider _avatar = AssetImage("images/Hank.png");

  MethodChannel _channel = MethodChannel("_PageMineState");

  final ImagePicker _picker = ImagePicker();

  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  Future<void> _onImageButtonPressed(BuildContext context) async {
    await _displayPickImageDialog(context,
        (double? maxWidth, double? maxHeight, int? quality) async {
      try {
        final XFile? pickedFile = await _picker.pickImage(
          source: ImageSource.gallery,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: quality,
        );
      } catch (e) {
        setState(() {});
      }
    });
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxWidth if desired'),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                      hintText: 'Enter maxHeight if desired'),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Enter quality if desired'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    final double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    final double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    final int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

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
              _onImageButtonPressed(context);
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
