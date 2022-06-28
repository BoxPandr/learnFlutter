import 'dart:async';
import 'dart:isolate';
import 'dart:io';


one(){
   Timer.run(() { 

    print("do async");
  });
}


void main(List<String> arguments) {


  print("start");


var cnt = 0;
Timer.periodic(Duration(seconds: 1), (timer) {
  print(cnt);
  cnt += 1;
  print(Isolate.current.debugName);

  if (cnt >= 3){
    timer.cancel();
  }


  
});
 


  print("end _");


}



