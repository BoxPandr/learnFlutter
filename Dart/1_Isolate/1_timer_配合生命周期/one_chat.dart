import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Util/Const.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<RecordZero> theOnes = [];

  bool _cancelConnectData = false;

  Timer? _sheduler;

  @override
  void initState() {
    compute((aa) {}, "");
    super.initState();

    var cnt = 0;
    _sheduler = Timer.periodic(Duration(seconds: 1), (timer) {
      print(cnt);
      cnt += 1;
      print(Isolate.current.debugName);

      if (cnt >= 99) {
        timer.cancel();
      }
    });

    fetchLines()
        .then((List<RecordZero> value) {
          if (_cancelConnectData) {
          } else {
            setState(() {
              theOnes = [];
              theOnes.addAll(value);
            });
          }
        })
        .catchError((err) {
          print("yyy ha ha  ${err}");
        })
        .whenComplete(() {
          print(" gg  ggg   ");
        })
        .timeout(Duration(seconds: 1)) //  milliseconds: 1
        .catchError((error) {
          _cancelConnectData = true;
          print("xxx ha ha  ${error}");
        });
  }

  Future<List<RecordZero>> fetchLines() async {
    _cancelConnectData = false;
    final url =
        Uri.parse('http://rap2api.taobao.org/app/mock/304046/api/chat/list');
    var response = await http.get(url);
    print('Response status Xx: ${response.statusCode}');
    if (response.statusCode == 200) {
      final infoRes = json.decode(response.body);
      List? aaa = infoRes["chat_list"];
      if (aaa == null) {
        throw Exception("猥琐的尼玛 _ _ _");
      } else {
        return aaa.map<RecordZero>((cake) {
          return RecordZero.from(cake);
        }).toList();
      }
    } else {
      throw Exception("猥琐的尼玛");
    }
  }

  PopupMenuItem<String> _rhsPopUp(String img, String name) {
    return PopupMenuItem(
        child: Row(
      children: [
        Image(image: AssetImage("images/圆加.png"), width: 30),
        SizedBox(width: 15),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    ));
  }

  Widget _cellAtItemX(BuildContext ctx, int row) {
    RecordZero e = theOnes[row];
    return ListTile(
      title: Text(e.name),
      subtitle: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(right: 12),
        height: 22,
        child: Text(
          e.msg,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(e.img),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final onePiece = {"name": "wo X", "nick": "哈哈哈"};
    final jsonX = json.encode(onePiece);
    print(jsonX);
    print(onePiece);
    print("the map");
    final newMap = json.decode(jsonX);
    print(newMap is Map);
    RecordOne one = RecordOne.from(onePiece);
    print(one);

    print("6 __ 66 __ ");
    final func = () {};
    print(func is Object);
    final cnt = theOnes.length;
    Widget xxx;
    if (cnt == 0) {
      xxx = Center(
        child: Text(
          "加载中 ， loading   ..  .. .",
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      );
    } else {
      xxx = ListView.builder(itemCount: cnt, itemBuilder: _cellAtItemX);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("One"),
        backgroundColor: MainColor,
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
            child: PopupMenuButton(
                color: Color.fromRGBO(0, 0, 0, 0.65),
                offset: Offset(0, 60),
                itemBuilder: (BuildContext ctx) {
                  return <PopupMenuItem<String>>[
                    _rhsPopUp("images/发起群聊.png", "发起群聊"),
                    _rhsPopUp("images/发起群聊.png", "发起群聊"),
                    _rhsPopUp("images/发起群聊.png", "发起群聊"),
                    _rhsPopUp("images/发起群聊.png", "发起群聊"),
                  ];
                },
                child: Image(
                  image: AssetImage("images/圆加.png"),
                  width: 25,
                )),
          ),
        ],
      ),
      body: Container(child: xxx),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_sheduler != null && _sheduler!.isActive) {
      _sheduler!.cancel();
    }
    super.dispose();
    print("销毁 Ta");
  }
}

class RecordOne {
  final String name;
  final String nick;

  RecordOne(this.name, this.nick);

  factory RecordOne.from(Map jsonX) {
    var result = RecordOne("", "");
    String? title = jsonX["name"];
    String? nee = jsonX["nick"];
    if (title != null && nee != null) {
      result = RecordOne(title, nee);
    }
    return result;
  }
}

class RecordZero {
  final String name;
  final String img;
  final String msg;

  RecordZero(this.name, this.img, this.msg);

  factory RecordZero.from(Map jsonX) {
    var result = RecordZero("", "", "");
    String? title = jsonX["name"];
    String? image = jsonX["img"];
    String? msg = jsonX["msg"];
    if (title != null && image != null && msg != null) {
      result = RecordZero(title, image, msg);
    }
    return result;
  }
}

// Flutter 渲染机制， 不在界面上的 Widget，就没有，

// 没有 iOS 复用的情况

// Flutter 通过 Widget 树，来渲染
