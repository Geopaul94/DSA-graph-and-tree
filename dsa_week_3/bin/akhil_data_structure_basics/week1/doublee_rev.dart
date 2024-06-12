class Node{
  dynamic data;
  Node? next;
  Node? prev;
  Node(this.data);
}
class LinkedList{
  Node? head;
  Node? tail;
  void add(data){
    Node newNode = Node(data);
    if(head==null){
      head = newNode;
      tail =newNode;

    }else{
      newNode.prev = tail;
      tail!.next = newNode;
      tail = newNode;
    }
  }
  void display(){
    Node? temp = head;
    while (temp!=null){
      print(temp.data);
      temp=temp.next;
    }
  }
  void revDisplay(){
    Node? temp = tail;
    while (temp!=null){
      print(temp.data);
      temp=temp.prev;
    }
  }
}
void main(){
  LinkedList a = LinkedList();
  a..add(5)..add(7)..add(4)..display()..revDisplay();
}