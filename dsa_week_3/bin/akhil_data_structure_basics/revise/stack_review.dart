
class Stack {
  List arr = [];
  
  push(value){
    arr.add(value);
  }
  pop()
{
 if(arr.isNotEmpty){
  arr.removeLast();
 }else{
  print('stack underflow');
 }
}
display(){
  print(arr);
}
peek(){
  print(arr[arr.length-1]);
}
removeElement(value){
  
  for (var i = 0; i < arr.length; i++) {
    if(arr[i]==value){
arr.removeAt(i);
    }
  }

}
}




void main(){
 Stack newStack = Stack();
 newStack..push(1)..push(4)..push(8)..removeElement(4)..display();

}
