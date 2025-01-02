
class Node{
  dynamic data;
  Node? next;
  Node (this.data);
}
class LinkedList{
  Node? head;
  Node? tail; 
  void addData(data){
    Node newNode = Node(data);
    if (head == null){
      head = newNode;
      tail=newNode;
    }else{
      tail!.next= newNode;
      tail = newNode;
    }


  }
  void search2(a,b){
Node? temp = head;
bool? x= false;
bool? y= false;
while (temp!=null) {
  if (temp.data==a){
    x=true;
  }else if (temp.data==b){
y= true;
  }
if(x==true&&y==true){
  break;
}

   temp = temp.next;
 
  
  
}
if(x==true&&y==true){
print('present');
}else{
  print("not present");
}

  }
  void display(){
   Node? temp = head;
   while(temp!=null){
    print(temp.data);
    temp = temp.next;
   }
  }
}
void main(){
  LinkedList a = LinkedList();
  a..addData(5)..addData(4)..addData(6)..display()..search2(5,4);
}