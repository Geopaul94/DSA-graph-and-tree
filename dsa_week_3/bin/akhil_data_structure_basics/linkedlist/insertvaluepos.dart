class Node{
  dynamic data;
  Node? next;
  Node(this.data);
}
class LinkedList{
  Node? head ;
  Node? tail;
  void add(data){
    Node newNode = Node(data);
    if (head == null ){
      head = newNode;
      tail = newNode;
    } else{
      tail?.next = newNode;
      tail = newNode;
    }

  }
  void display(){
    Node? temp= head;
    while (temp!=null){
      print(temp.data);
      temp = temp.next;
    }
  }
  // void addAtPos(target, value){
  //   Node? temp = head;
  //   Node? prev;
  //   Node newNode =Node(value);
  //   if (temp==null){
  //     head = newNode;
  //     tail = newNode;
  //   }
  //   int c = 0;
  //   while (temp!=null&& c!=target){


  //   }

 // }
 addWithIndex(index, data) {
    Node? current = head;
    int currentindex = 0;
    while (current != null) {
      currentindex++;
      if (currentindex == index) {
        break;
      } else {
        current = current.next;
      }
    }
    if (current != null) {
      current.data = data;
    }
  }
void addAtPos(int target, int value) {
    Node? temp = head;
    Node? prev;

    if (temp == null) {
      // If the list is empty, create a new node with the given value and set it as the head
      head = Node(value);
      return;
    }

    int currentPosition = 0;

    // Traverse the list to find the target position or the end of the list
    while (temp != null && currentPosition < target) {
      prev = temp;
      temp = temp.next;
      currentPosition++;
    }

    // If the target position is found or if it's at the end of the list
    // Create a new node with the given value
    Node newNode = Node(value);

    // If inserting at the beginning (target = 0)
    if (target == 0) {
      newNode.next = head;
      head = newNode;
    } else {
      // Otherwise, insert the new node at the target position
      prev?.next = newNode;
      newNode.next = temp;
    }
  }

}
void main(){
   LinkedList a = LinkedList();
   a..add(1)..add(2)..add(3)..add(7)..display()..addWithIndex(1, 4)..addAtPos(3, 8);
   print('------------------') ;
   a.display();

  }