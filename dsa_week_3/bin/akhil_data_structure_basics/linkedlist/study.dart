class Node {
  dynamic data; 
  Node? next;
  Node (this.data);
}
class LinkedList{
  Node? head; 
  
  void addData (data){
    Node newNode = Node(data);
    if(head ==null){
      head = newNode;
      return;
    }
  

  
  }
    void display(){
      Node? temp = head;
      while (temp!=null){
        print(temp.data);
        temp = temp.next;
      }
    }

}
void main() {
  LinkedList test = LinkedList();
  test..addData(5)..addData(10)..addData(8)..display();
  
}