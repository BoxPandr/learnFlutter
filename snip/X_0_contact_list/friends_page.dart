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
  List<ContactPerson> _mainData = [];

  final List _headerData = [
    ContactPerson('images/icon_friends_add.png', '新的朋友', ''),
    ContactPerson("images/icon_friends_add.png", "群聊", ""),
    ContactPerson("images/icon_friends_add.png", "标签", ""),
    ContactPerson("images/icon_friends_add.png", "公众号", "")
  ];

  List<String> chars = [];

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
    while (i < cnt) {
      ContactPerson pp = _mainData[i];
      String first = pp.firstLetter;
      if (key == first) {
        pp.firstLetter = '';
      } else {
        key = first;
        chars.add(first);
      }
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
              itemBuilder: _cellAtIdx,
              itemCount: _headerData.length + _mainData.length,
            ),
          ),
          IndexBar(chars),
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

  IndexBar(this.chars);

  @override
  State<IndexBar> createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  bool doing = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double s_height = kScreenHeight(context);

    Color bgColor = Color.fromRGBO(1, 1, 1, 0.3);
    Color txtColor = Colors.black;
    double txtSize = 17;
    double smallContainerX_h = 30;
    if (doing) {
      bgColor = Color.fromRGBO(1, 1, 1, 0.61);
      txtColor = Colors.white;
      txtSize = 21;
      smallContainerX_h = 40;
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

    double marginTop =
        (s_height - smallContainerX_h * rightElements.length - 200) * 0.5;

    return Positioned(
        width: 30,
        right: 15,
        top: marginTop,
        bottom: marginTop,
        child: GestureDetector(
          onVerticalDragDown: (DragDownDetails details) {
            setState(() {
              doing = true;
            });
          },
          child: Container(
            alignment: Alignment.center,
            color: bgColor,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: rightElements,
            ),
          ),
        ));
  }
}
