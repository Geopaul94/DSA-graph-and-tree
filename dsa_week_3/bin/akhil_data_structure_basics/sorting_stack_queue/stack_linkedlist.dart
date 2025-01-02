class Node{
  dynamic data;
  Node? next;
  Node? prev;
  Node(this.data);
}
class LinkedList {
  Node? head;
  Node? tail;
  void push (data){
    Node newNode = Node(data);
    if(head ==null){
      head= newNode;
      
    }else{
      newNode.next = head;
     head = newNode;
    }
  }
  void display(){
Node? temp=head ;
while (temp!=null){
  print(temp.data);
  temp=temp.next;
}
  }
  void pop(){
    if(head==null){
      print('staack underflow');
    }else{
   head = head?.next;
    }
    display();
     
    }
  }


void main(){
  LinkedList a = LinkedList();
  a..push(5)..push(7)..push(2)..display()..pop();
}