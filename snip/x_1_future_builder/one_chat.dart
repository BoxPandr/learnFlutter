import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Util/Const.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    //  fetchLines().then((value) {});
  }

  Future<List<RecordZero>> fetchLines() async {
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
      body: Container(
        child: FutureBuilder(
            future: fetchLines(),
            builder:
                (BuildContext ctx, AsyncSnapshot<List<RecordZero>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text(
                    "加载中 ， loading   ..  .. .",
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "加载 OK",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                );
              }
            }),
      ),
    );
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
  final String imsg;

  RecordZero(this.name, this.img, this.imsg);

  factory RecordZero.from(Map jsonX) {
    var result = RecordZero("", "", "");
    String? title = jsonX["name"];
    String? image = jsonX["img"];
    String? msg = jsonX["imsg"];
    if (title != null && image != null && msg != null) {
      result = RecordZero(title, image, msg);
    }
    return result;
  }
}
