import 'dart:io';

void main(List<String> arguments) {


  print("start");

  Future((){
    sleep(Duration(seconds: 1));
    print("A");
  });

Future((){
    print("B");
  });


  Future((){
    sleep(Duration(seconds: 3));
    print("C");
  });


Future((){
    print("D");
  });


  print("end");


}

