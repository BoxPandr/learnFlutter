import 'dart:async';

import 'dart:io';

import 'dart:isolate';


String gotCha = "haha";

void main(List<String> arguments) {


  print("start");


  // 对讲机

  // 1， 创建端口

  // port, 进程间通讯，通过端口

  ReceivePort port = ReceivePort();


  // 2 ,  创建 Isolate,

  Isolate.spawn(msg, port.sendPort);


  // 3, 监听

  port.listen((message) {
    
    gotCha = "666";

  });

  sleep(Duration(seconds: 2));


  print("end _ $gotCha");


}





msg(SendPort port){


port.send("call back");

}
