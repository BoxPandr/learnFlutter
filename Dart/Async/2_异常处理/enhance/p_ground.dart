import 'dart:io';

void main(List<String> arguments) {
  

threeErr();
}



one(){


fetchX();
print("D ++ ");

}



three(){

  


  fetchYy();
  sleep(Duration(seconds: 1));

  print("D ++ ");


}



threeErr(){


  fetchYy_err();
  sleep(Duration(seconds: 1));

  print("D ++ ");


}



fourDo(){

  fetchZzzz();

  print("D ++ __ ");
}


String a = '白板';

fetchX() async{

print("C begin");



// await 的使用:

// 1, 后面的操作，必须是异步 ( async ),
// 才能用 await

// 2， 他被使用的函数，必须是异步 ( async ) 函数

await Future((){
  for (var i = 0; i < 10000; i++) {
  a = "哈哈哈";
  throw Exception("    xxx  xx   ");
}

});

print("C end : $a");

print("F _ more");

}







fetchYy(){

print("C begin");

Future promise = Future((){
  for (var i = 0; i < 10000; i++) {
  a = "哈哈哈";
  throw Exception("    xx _  x  _ x   ");
}

});

// 使用 then ，来接收数据


promise.catchError((err){
  print("捕获到了" + err.toString());
}).then((value){

  print("C end : $a");

}, onError: (err){
  print("处理   " + err.toString());
});




print("F _ more");


}






fetchYy_err(){

print("C begin");

Future promise = Future((){
  for (var i = 0; i < 10000; i++) {
  a = "哈哈哈";
  throw Exception("    xx _  x  _ x   ");
}

});

// 使用 then ，来接收数据


promise.catchError((err){
  print("捕获到了" + err.toString());
  
}).then((value){

  print("C end : $a    $value");

});


print("F _ more");


}


fetchZzzz(){

print("C begin");

Future promise = Future((){
  for (var i = 0; i < 10000; i++) {
  a = "哈哈哈";
}
return "666";
});

// 使用 then ，来接收数据


promise.then((val){

  print("C end : $a   $val");

});




print("F _ more");


}


