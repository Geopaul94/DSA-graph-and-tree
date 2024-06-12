class Node{
  dynamic data;
  Node? next;
  Node? prev;
  Node (this.data);
}
class LinkedList{
  Node? head; 
  Node? tail;
  void addData(data){
    Node newNode = Node(data);
    if(head == null){
      head = newNode;
      tail = newNode;
    }else{
       newNode.prev = tail;
      tail!.next = newNode;
     
      tail = newNode;
    }

  }
  void display(){
   Node? temp = head;
   while(temp!=null){
    print(temp.data);
    temp =temp.next;
   }

  }
  void displayRev(){
    Node? temp = tail;
     while(temp!=null){
    print(temp.data);
    temp =temp.prev;
   }

  }
}
void main(){
  LinkedList test = LinkedList();
  test..addData(5)..addData(7)..addData(3)..display()..displayRev();
}