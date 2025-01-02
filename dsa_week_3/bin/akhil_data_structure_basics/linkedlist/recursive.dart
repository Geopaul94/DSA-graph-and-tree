

class Node{
  int data;
  Node? next;
  Node(this.data);
}
class LinkedList{
Node? head;
  void adddataToHead(int data){
    Node newNode=Node(data);
    newNode.next=head;
    head=newNode;
  }

  void addDataToTail(int data){
    Node newNode=Node(data);
    if(head==null){
      head=newNode;
      return;
    }
    Node? current= head;
    while(current?.next!=null){                  
      current=current?.next;
    }
    current?.next=newNode;
  }

  void recursiveAdding(Node? current,int data){
   if(current==null){
    current=Node(data);
   }
   if(current.next==null){
    current.next=Node(data);
   }
   recursiveAdding(current, data);
  }
  void recursiveAdding2(Node? current, int data) {
  if (current == null) {
    
    current = Node(data);
  } else if (current.next == null) {
    
    current.next = Node(data);
  } else {
    
    recursiveAdding(current.next, data);
  }
}

  void printforward(){
    Node? current=head;
    while(current!=null){
      print(current.data);{
        current=current.next;
      }
    }
  }

}
void main(List<String> args) {
  LinkedList linkedList = LinkedList();

  // Adding nodes to the linked list using recursiveAdding method
  linkedList.recursiveAdding2(linkedList.head, 1);
  linkedList.recursiveAdding2(linkedList.head, 2);
  linkedList.recursiveAdding2(linkedList.head, 3);

  // Displaying the linked list
  print("Linked List:");
  linkedList.printforward();
}