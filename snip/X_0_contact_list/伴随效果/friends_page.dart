import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/Util/Const.dart';
import 'package:untitled/models/Contact.dart';

import 'Cells/DiscoverCell.dart';

class Pals extends StatefulWidget {
  const Pals({Key? key}) : super(key: key);

  @override
  _PalsState createState() => _PalsState();
}

class _PalsState extends State<Pals> {
  Map<String, double> _groupOffsetPairs = {};

  ScrollController _scrollController = ScrollController();

  List<ContactPerson> _mainData = [];

  final List _headerData = [
    ContactPerson('images/icon_friends_add.png', '新的朋友', ''),
    ContactPerson("images/icon_friends_add.png", "群聊", ""),
    ContactPerson("images/icon_friends_add.png", "标签", ""),
    ContactPerson("images/icon_friends_add.png", "公众号", "")
  ];

  List<String> chars = [];

  double get screenTotalHeight {
    var pixelRatio = window.devicePixelRatio;
    //Size in logical pixels
    var logicalScreenSize = window.physicalSize / pixelRatio;
    var logicalHeight = logicalScreenSize.height;
    var paddingTop = window.padding.top / window.devicePixelRatio;
    var paddingBottom = window.padding.bottom / window.devicePixelRatio;
    var safeHeight = logicalHeight - paddingTop - paddingBottom;
    return safeHeight;
  }

  @override
  void initState() {
    super.initState();

    _mainData.addAll(dataXxx);

    _mainData.sort((ContactPerson aa, ContactPerson bb) {
      var result = aa.firstLetter.compareTo(bb.firstLetter);
      if (result == 0) {
        result = aa.name.compareTo(bb.name);
      }
      return result;
    });

    var key = _mainData[0].firstLetter;
    print(key);
    int cnt = _mainData.length;
    var i = 1;
    chars.add(key);
    double offset = 55 * 4;
    _groupOffsetPairs[key] = offset;

    offset += 30;
    double totalHeight = offset;
    while (i < cnt) {
      ContactPerson pp = _mainData[i];
      String first = pp.firstLetter;
      if (key == first) {
      } else {
        key = first;
        totalHeight += 30;
      }
      totalHeight += 55;
      i += 1;
    }
    double safeHeight = totalHeight - screenTotalHeight + 70;
    i = 1;
    key = _mainData[0].firstLetter;
    while (i < cnt) {
      ContactPerson pp = _mainData[i];
      String first = pp.firstLetter;
      if (key == first) {
        pp.firstLetter = '';
      } else {
        key = first;
        chars.add(first);
        _groupOffsetPairs[first] = min(offset, safeHeight);
        offset += 30;
      }
      offset += 55;
      i += 1;
    }
  }

  Widget _cellAtIdx(BuildContext ctx, int index) {
    int firstCnt = _headerData.length;
    if (index < firstCnt) {
      ContactPerson p = _headerData[index];
      return _PalItem(p.name, "", "", p.img);
    } else {
      int idxBelow = index - firstCnt;
      ContactPerson p = _mainData[idxBelow];
      return _PalItem(p.name, p.img, p.firstLetter, "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One"),
        backgroundColor: MainColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext ctx) => DiscoverIntoPage("拉人头")));
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Image(
                image: AssetImage("images/icon_friends_add.png"),
                width: 25,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white12,
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: _cellAtIdx,
              itemCount: _headerData.length + _mainData.length,
            ),
          ),
          IndexBar(chars, (String str) {
            double? dy = _groupOffsetPairs[str];
            if (dy == null) {
              return;
            }
            _scrollController.animateTo(dy,
                duration: Duration(milliseconds: 100), curve: Curves.ease);
          }),
        ],
      ),
    );
  }
}

class _PalItem extends StatelessWidget {
  final String img;
  final String name;
  final String groupTitle;
  final String localImg;

  _PalItem(this.name, this.img, this.groupTitle, this.localImg);

  @override
  Widget build(BuildContext context) {
    ImageProvider imgXx;
    if (img.length > 0) {
      imgXx = NetworkImage(img);
    } else if (localImg.length > 0) {
      imgXx = AssetImage(localImg);
    } else {
      imgXx = AssetImage(placeholderImg);
    }

    print(groupTitle);

    List<Widget> result = [];
    if (groupTitle.length > 0) {
      result.add(Container(
          margin: EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          color: Colors.transparent,
          height: 30,
          child: Text(
            groupTitle,
            style: TextStyle(fontSize: 30),
          )));
    }
    result.add(Container(
      color: Colors.white,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(image: imgXx)),
          ),
          Container(
            child: Text(
              name,
              style: TextStyle(fontSize: 30),
            ),
          )
        ],
      ),
    ));
    result.add(Container(
      height: 1,
      color: MainColor,
      child: Row(
        children: [
          Container(
            width: 50,
            color: Colors.white,
          )
        ],
      ),
    ));
    return Column(
      children: result,
    );
  }
}

class IndexBar extends StatefulWidget {
  final List<String> chars;

  final void Function(String char) indexBarCallback;

  IndexBar(this.chars, this.indexBarCallback);

  @override
  State<IndexBar> createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  bool doing = false;

  String showTxt = "";

  double _indicatorY = 0;
  bool _hideIndicator = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int _getIndex(
      BuildContext context, double theHeight, Offset info, double itemHeight) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset pt = box.globalToLocal(info);

    int index = pt.dy ~/ itemHeight;
    return index.clamp(0, widget.chars.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    double s_height = kScreenHeight(context);

    Color bgColor = Color.fromRGBO(1, 1, 1, 0.3);
    Color txtColor = Colors.black;
    double txtSize = 17;
    double smallContainerX_h = 30;
    double rightW = 20;
    if (doing) {
      bgColor = Color.fromRGBO(1, 1, 1, 0.61);
      txtColor = Colors.white;
      txtSize = 21;
      smallContainerX_h = 40;
      rightW = 30;
    }

    List<Widget> rightElements = [];
    rightElements.addAll(widget.chars.map((e) {
      return Expanded(
          child: Container(
        alignment: Alignment.center,
        child: Text(e, style: TextStyle(fontSize: txtSize, color: txtColor)),
        margin: EdgeInsets.all(5),
      ));
    }));

    double theHeight = smallContainerX_h * rightElements.length;
    double topOffset = (kScreenHeight(context) - theHeight) * 0.3;
    double leftW = 100;

    List<Widget> lhsBoys = [];
    if (_hideIndicator == false) {
      print("走不走");
      lhsBoys.addAll([
        Image(
          image: AssetImage("images/气泡.png"),
          width: 60,
        ),
        Text(
          showTxt,
          style: TextStyle(fontSize: 30, color: Colors.yellow),
        )
      ]);
    }
    return Positioned(
        top: topOffset,
        width: leftW + rightW,
        right: 15,
        height: theHeight,
        child: Row(
          children: [
            Container(
              alignment: Alignment(0, _indicatorY),
              width: leftW,
              child: Stack(
                alignment: Alignment(-0.2, 0),
                children: lhsBoys,
              ),
            ),
            GestureDetector(
              onVerticalDragDown: (DragDownDetails details) {
                var itemHeight = theHeight / (widget.chars.length);
                int idx = _getIndex(
                    context, theHeight, details.globalPosition, itemHeight);
                String char = widget.chars[idx];
                double halfHeight = theHeight * 0.5;
                int len = widget.chars.length;
                setState(() {
                  print("xxxxx");
                  _indicatorY = 2.2 * (idx + 0.5) / len.toDouble() - 1.1;
                  showTxt = char;
                  _hideIndicator = false;
                  doing = true;
                });
                widget.indexBarCallback(char);
              },
              onVerticalDragUpdate: (DragUpdateDetails info) {
                var itemHeight = theHeight / (widget.chars.length);
                int idx = _getIndex(
                    context, theHeight, info.globalPosition, itemHeight);
                String char = widget.chars[idx];
                double halfHeight = theHeight * 0.5;
                int len = widget.chars.length;
                setState(() {
                  print("xxxxx");
                  _indicatorY = 2.2 * (idx + 0.5) / len.toDouble() - 1.1;
                  showTxt = char;
                  _hideIndicator = false;
                });
                widget.indexBarCallback(char);
              },
              onVerticalDragEnd: (DragEndDetails info) {
                setState(() {
                  doing = false;
                  _hideIndicator = true;
                });
              },
              child: Container(
                width: rightW,
                alignment: Alignment.center,
                color: bgColor,
                child: Column(
                  children: rightElements,
                ),
              ),
            )
          ],
        ));
  }
}
