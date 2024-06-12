stringRevRec(String name){
  if(name.length<=1){
    return name;
  }else{
    return stringRevRec(name.substring(1))+name[0];
  }
}
void main(){
  String name = 'abcd';
  String rev = stringRevRec(name);
  print(rev);
}