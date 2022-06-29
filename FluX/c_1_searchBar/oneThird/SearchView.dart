import 'package:flutter/material.dart';
import 'package:untitled/Util/Const.dart';

class SearchTopView extends StatefulWidget {
  const SearchTopView({Key? key}) : super(key: key);

  @override
  State<SearchTopView> createState() => _SearchTopViewState();
}

class _SearchTopViewState extends State<SearchTopView> {
  bool _showClear = false;
  TextEditingController _inputCtrl = TextEditingController();

  void _txtVary(String value) {
    setState(() {
      _showClear = (value.length > 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    double upHeight = 40;
    double downHeight = 44;
    double downInnerH = 34;
    double downInnerLhsH = 5;
    double rhsCancelWidth = 40;
    double lhsContentW = kScreenWidth(context) - rhsCancelWidth;

    List<Widget> lhsContentArr = [
      SizedBox(width: 3),
      Image(
        image: AssetImage("images/放大镜.png"),
        width: 20,
        color: Colors.grey,
      ),
      Expanded(
          child: TextField(
        controller: _inputCtrl,
        onChanged: _txtVary,
        autofocus: true,
        cursorColor: Colors.green,
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(5, 3, 5, 3),
            border: InputBorder.none,
            hintText: "请输入"),
      )),
    ];
    if (_showClear) {
      lhsContentArr.addAll([
        GestureDetector(
          onTap: () {
            setState(() {
              _inputCtrl.clear();
              _showClear = false;
            });
          },
          child: Icon(
            Icons.cancel,
            size: 20,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 3),
      ]);
    }

    return Container(
      height: upHeight + downHeight,
      color: MainColor,
      child: Column(
        children: [
          SizedBox(
            height: upHeight,
          ),
          Container(
            height: downHeight,
            child: Row(
              children: [
                Container(
                  width: lhsContentW,
                  height: downInnerH,
                  margin:
                      EdgeInsets.fromLTRB(downInnerLhsH, 0, downInnerLhsH, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white),
                  child: Row(
                    children: lhsContentArr,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("取消"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  Widget _itemAtIndex(BuildContext context, int index) {
    return Container(
      height: 40,
      child: Text("11"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchTopView(),
          Expanded(
              flex: 1,
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: 3, itemBuilder: _itemAtIndex)))
        ],
      ),
    );
  }
}
