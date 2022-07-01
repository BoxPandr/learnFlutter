



main(){

NumX? n = NumX();
int? number;
number = n.cnt;
print(number);

}




one_fromStr(){
  var aaa = int.parse("123");
assert(aaa == 123);

var bbb = double.parse("1.23");
assert(bbb == 1.23);

print("a: $aaa, b : $bbb");
}


two_to_str(){
  String oneWord = 66.toString();
assert(oneWord == "66");


String twoWord = 66.66666.toStringAsFixed(3);
print(twoWord);
assert(twoWord == "66.667");
}


three(){
  const a = 66;
const b = false;
const c = "隔壁 老杂种";

print(a);
print(b);
print(c);


print(a.runtimeType);
print(b.runtimeType);
print(c.runtimeType);
}



class NumX{
  int cnt = 66;
}


four(){
  int? num;
print(num);

int mathX;
NumX? one = NumX();

mathX = one.cnt;

print(mathX);

}


five(){
  var n;
int? number;
number = n?.lenth;
print(number);
}