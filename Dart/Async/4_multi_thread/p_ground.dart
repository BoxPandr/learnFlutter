import 'dart:async';

import 'dart:io';

import 'dart:isolate';


String aaa = "在哪里";

void main(List<String> arguments) {


  print("start");

  seventh();
  sleep(Duration(seconds: 2));


  print("end $aaa");


}





five(){

Future a_a = Future(() => null);

a_a.then((value){
  print("A ");

  scheduleMicrotask((){
    print("B_");

  });




}).then((value) => print("C_C"));


Future three = Future((){

  print("3");
  return "444";
});

Future((){

  print("55");
});

scheduleMicrotask((){
  print("22222");
});


three.then((value) => print(value));




print("11");

}






sixth(){


  Isolate.spawn(goStr, "11");

Isolate.spawn(goStr, "22");
Isolate.spawn(goStr, "33");
Isolate.spawn(goStr, "44  4");
Isolate.spawn(goStr, "5  5 5  5");
Isolate.spawn(goStr, "66  6");



}



goStr(String  name){
  print(name);
}






seventh(){

Isolate.spawn(assign, "66  6");

}



assign(String  name){
  aaa = name;
  print("$aaa");
}