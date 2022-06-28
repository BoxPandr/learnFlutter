import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



info(String aa) {
  gotCha = "去";
  print("come on");
}

String gotCha = "haha";

void main() {
  print("start");

  compute(info, "666");

  sleep(Duration(seconds: 2));

  print("end _ $gotCha");

}