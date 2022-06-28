import 'package:dio/dio.dart';



  Dio netX = Dio();
  netX
      .download("https://down.qq.com/txedupc/Mac/TXEDU_3.0.5.1078.dmg",
          "/Users/jzd/Desktop/腾讯课堂.dmg",
          onReceiveProgress: showProgress)
      .then((value) => print(value))
      .whenComplete(() {
    print("结束了 --- end");
  });








void showProgress(int count, int total) {
  if (total > 1) {
    print(" 下载了   " +
        (100 * (count + 0.0) / (total + 0.0)).toStringAsFixed(0) +
        " %");
  }
}
