class Node{
  dynamic data; 
  Node? next;
  Node(this.data);

}
class LinkedList {
  Node? head;
  Node? tail;
  void addData(data){
    Node newNode = Node(data);
    if(head == null){
      head = newNode;
      tail = newNode;
    }else{
      tail!.next =newNode;
      tail = newNode;
    }
  }

}