import 'dart:io';

void main(List<String> arguments) {
  

three();
}



one(){


fetchX();
print("D ++ ");

}



two(){

  fetchX();
  sleep(Duration(seconds: 1));

  // Future, 异步， 

  // 闲下来了，再去做

  // 外部的，同步操作，完成后，才会做
print("D ++ ");


}



three(){


  fetch_yy();
  sleep(Duration(seconds: 1));

  print("D ++ ");


}


fetchX(){

print("C begin");
int a = 0;
Future((){
  for (var i = 0; i < 10000; i++) {
  a += i;
}
print("C end");
});



}







fetch_yy(){

print("C begin");

Future((){
 
print("C end");
});



}


