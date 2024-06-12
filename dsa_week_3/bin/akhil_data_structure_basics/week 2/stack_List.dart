push(List arr,value){
  arr.add(value);
  print(arr);

}
pop(List arr){
  if(arr.length<=0){
    print('Stack underflow');
    return;
  
  }
    arr.removeLast();
print(arr);
  

}
void main(){
  List arr = [];
  pop(arr);
  push(arr,1);
  push(arr,2);
  push(arr,3);
  pop(arr);
}