import 'dart:io';



int info(String aa) {
  gotCha = "去";
  print("come on");
  return 66;
}

String gotCha = "haha";

ccc() async {
  print("start");

  int val = await compute(info, "666");
  print("有意思 $val");
  sleep(Duration(seconds: 2));

  print("end _ $gotCha");
}

void main() {
  ccc();


}