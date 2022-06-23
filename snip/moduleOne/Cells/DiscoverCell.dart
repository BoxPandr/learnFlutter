import 'package:flutter/material.dart';

class DiscoverItem extends StatelessWidget {
  final String name;
  final String img;

  final String nameRhs;
  final String imgRhs;

  DiscoverItem(this.name, this.img, this.nameRhs, this.imgRhs);

  @override
  Widget build(BuildContext context) {
    var rhsViews = <Widget>[];
    if (nameRhs.length > 0) {
      rhsViews.add(Text(nameRhs));
    }
    if (imgRhs.length > 0) {
      rhsViews.add(Image.asset(
        imgRhs,
        width: 15,
      ));
    }
    rhsViews.add(Image.asset("images/icon_right.png", width: 15));

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext ctx) => DiscoverIntoPage(name)));
      },
      child: Container(
        color: Colors.white,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(children: <Widget>[
                Image(image: AssetImage(img), width: 20),
                SizedBox(width: 15),
                Text(name)
              ]),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: rhsViews,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DiscoverIntoPage extends StatelessWidget {
  final String titleX;

  DiscoverIntoPage(this.titleX);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleX),
      ),
    );
  }
}
