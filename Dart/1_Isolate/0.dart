import 'dart:isolate';

import 'package:flutter/foundation.dart';


info(String aa) {
  //  print(Isolate.current.debugName);
}

ccc() {
  Future(() => compute(info, "11")).then((value) => print(11));
  Future(() => compute(info, "11")).then((value) => print(22));
  Future(() => compute(info, "11")).then((value) => print(33));
  Future(() => compute(info, "11")).then((value) => print(44));
  Future(() => compute(info, "11")).then((value) => print(55));
}

Future haha() {
  return Future(() {
    // print(Isolate.current.debugName);
    compute(info, "11");
  });
}

Future wanwan() {
  return Future(() {
    return compute(info, "11");
  });
}

ddd() {
  haha().then((value) => print(11));
  haha().then((value) => print(22));
  haha().then((value) => print(33));
  haha().then((value) => print(44));
  haha().then((value) => print(55));
}

fff() {
  wanwan().then((value) {
    print(Isolate.current.debugName);
    print(11);
  });
  wanwan().then((value) => print(22));
  wanwan().then((value) => print(33));
  wanwan().then((value) => print(44));
  wanwan().then((value) => print(55));
}