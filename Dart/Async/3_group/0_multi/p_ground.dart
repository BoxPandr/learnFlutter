import 'dart:io';

void main(List<String> arguments) {


  print("start");



// then, 比   Future 的默认队列，优先级高
  Future((){
    sleep(Duration(seconds: 1));
    return "A";
  }).then((value){
    print(value);
    return "B";
  }).then((value){
    print(value);
  });

Future((){
    print("C");
  });



Future((){
    sleep(Duration(seconds: 3));
    return "D";
  }).then((value){
    print(value);
  });

Future((){
    return "D";
  }).then((value){
    print(value);
  });


  print("end");


}

