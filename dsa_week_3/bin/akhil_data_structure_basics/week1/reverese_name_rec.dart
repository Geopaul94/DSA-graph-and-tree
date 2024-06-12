stringRev(String a){
if(a.length<=1){
  return a;
}
else{
  return stringRev(a.substring(1)) + a[0];
}
}
void main(){
  String a = 'akhil';
 String b = stringRev(a);
 print(b);
}