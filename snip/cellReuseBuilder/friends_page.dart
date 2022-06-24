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
  final List _headerData = [
    ContactPerson('images/icon_friends_add.png', '新的朋友', ''),
    ContactPerson("images/icon_friends_add.png", "群聊", ""),
    ContactPerson("images/icon_friends_add.png", "标签", ""),
    ContactPerson("images/icon_friends_add.png", "公众号", "")
  ];

  Widget _cellAtIdx(BuildContext ctx, int index) {
    int firstCnt = _headerData.length;
    if (index < firstCnt) {
      ContactPerson p = _headerData[index];
      return _PalItem(p.name, "", "", p.img);
    } else {
      int idxBelow = index - firstCnt;
      ContactPerson p = dataXxx[idxBelow];
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
      body: ListView.builder(
        itemBuilder: _cellAtIdx,
        itemCount: _headerData.length + dataXxx.length,
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

    return Column(
      children: [
        Row(
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
        Container(
          height: 1,
          color: MainColor,
        )
      ],
    );
  }
}
