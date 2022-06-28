import 'dart:io';


import 'package:dio/dio.dart';







  print(Directory.systemTemp.path);
  Dio netX = Dio();
  netX
      .download("https://down.qq.com/txedupc/Mac/TXEDU_3.0.5.1078.dmg",
          (header) {
        return Directory.systemTemp.path + "/腾讯课堂.dmg";
      }, onReceiveProgress: showProgress)
      .then((value) => print(value))
      .whenComplete(() {
        print("结束了 --- end");
      });