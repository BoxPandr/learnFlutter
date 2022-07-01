import 'dart:io';


main(){
  var rawContent = r'老不死的，偷""了我的\n\n\n雨伞';

  print(rawContent);

  String xxx = '老不死的邻居\'，"偷了"我的\n\n\n雨伞';
  print(xxx);

  String poem = '''
  侠客行，

  十步杀一人
  ''';
  print(poem);
}



one(){
  var first = "Hi ";
  String last = " 666";
  print(first + last);
}



two(){
   stdout.writeln("what the f");
String? matter = stdin.readLineSync();
if (matter == null){
  return;
};
print("the matter is ${matter}");
}



three(){
  dynamic elderBitch = "Maa";
  print("endure the $elderBitch");
  elderBitch = 11;

  print("then smile to $elderBitch");
  elderBitch = null;
 print("the show must go on $elderBitch");
}



