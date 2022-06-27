import 'dart:async';
import 'dart:io';

void main(List<String> arguments) {


  print("start");


third();

  sleep(Duration(seconds: 2));


  print("end");


}




one(){


  Future.wait([Future((){

    return "A + ";

  }),  Future((){

    sleep(Duration(seconds: 3));
    return "   B : ";

  })]).then((value) => print(value[0] + value[1]));


}





second(){
  Future((){
    print("A ~");
    return "A +";
  }).then((value) => print(value));


Future((){
    print("B ~");
    return "B +";
  }).then((value) => print(value));


}





third(){
  Future((){
    print("A ~");
    return "A +";
  }).then((value) => print(value));


Future((){
    print("B ~");
    return "B +";
  }).then((value) => print(value));


scheduleMicrotask((){

  print("micro task C");
});
}