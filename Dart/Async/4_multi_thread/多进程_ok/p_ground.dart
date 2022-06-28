import 'dart:async';

import 'dart:io';

import 'dart:isolate';


String gotCha = "haha";

void main(List<String> arguments) {


  print("start");

  b_b_b();


  sleep(Duration(seconds: 2));


  print("end _ $gotCha");


}





void msg(SendPort port){


port.send("call back");

}



a_a_a(){
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
}



b_b_b() async{
    // 对讲机

  // 1， 创建端口

  // port, 进程间通讯，通过端口

  ReceivePort port = ReceivePort();


  // 2 ,  创建 Isolate,

  Isolate process = await Isolate.spawn(msg, port.sendPort);




  // 3, 监听

  port.listen((message) {
    print(message);
    gotCha = "666";
    port.close();
    process.kill();
  });

  print("next line");
}





