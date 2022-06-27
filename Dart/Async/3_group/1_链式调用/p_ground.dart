import 'dart:io';

void main(List<String> arguments) {


  print("start");


three();



  print("end");


}



one(){

// then, 比   Future 的默认队列，优先级高
  Future((){
    sleep(Duration(seconds: 1));
    return "A";
  }).then((value){
    print(value);
    return "B";
  })
  .then((value){
    print(value);
    sleep(Duration(seconds: 3));
    return "C";
  })
  .then((value){
    print(value);
    return "D";
  })
  .then((value){
    print(value);
  });


}






two(){

// then, 比   Future 的默认队列，优先级高
  Future((){
    sleep(Duration(seconds: 1));
    throw Exception("A");
  }).then((value){
    print(value);
    return "B";
  })
  .then((value){
    print(value);
    sleep(Duration(seconds: 3));
    return "C";
  })
  .then((value){
    print(value);
    return "D";
  })
  .then((value){
    print(value);
  }).catchError((err){


    print(err.toString());

  });


}






three(){

// then, 比   Future 的默认队列，优先级高
  Future((){
    sleep(Duration(seconds: 1));
    return "A";
  }).then((value){
    print(value);
    return "B";
  })
  .then((value){
    print(value);
    sleep(Duration(seconds: 3));
    throw Exception("C");
  })
  .then((value){
    print(value);
    return "D";
  })
  .then((value){
    print(value);
  }).catchError((err){
    print("n n n ${err.toString()}");
  });


}


