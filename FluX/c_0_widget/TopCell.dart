import 'package:flutter/material.dart';
import 'package:untitled/Util/Const.dart';

class TopSearchCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double edge = 8;
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.fromLTRB(edge, 0, edge, 5),
        height: 44,
        color: MainColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/放大镜.png"),
                  width: 15,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
