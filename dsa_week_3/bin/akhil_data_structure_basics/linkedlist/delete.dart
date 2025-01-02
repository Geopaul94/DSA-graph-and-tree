

class Node{
  dynamic data;
  Node? next;
  Node(this.data);
}
class LinkedList{
  Node? head;
  Node? tail;
  void addData(value){
    Node newNode = Node(value);
    if(head==null){
      head = newNode;
      tail = newNode;
    }else{
      tail!.next = newNode;
      tail = newNode;
    }
  }
  void display(){
    Node? current = head;
    while (current!=null){
      print(current.data);
      current= current.next;
    }
  }
  void displayasarray(){
     Node? current = head;
    List g = [];
     while (current!=null){
     g.add(current.data);
      current= current.next;
    }
    print(g);
  }
  void revese(){
    Node? current = head;
    Node? next;
    Node? prev;
    while(current!=null){
      next = current.next;
      current.next = prev;
      prev= current;
      current= next;
    }
    head = prev;
  }
  void insertafter(target , value){
    if(head ==null){
      print('empty');
      return;
    }
    Node? temp = head;
    Node newNode =Node(value);
    while(temp!=null&&temp.data!=target){
      temp = temp.next;

    }
    if(temp?.data == null){
      print('no target found');
      return;
    }
    if (temp!.data==target){
      newNode.next= temp.next;
      temp.next = newNode;
    }
  }
  void insertBefore(target,value){
    Node newNode = Node(value);
    if(head==null){
      return;
    }
    if(head!.data==target){
      newNode.next = head;
      head = newNode;
      return;

    }
    Node? temp = head;
    while (temp!=null &&temp.next!.data!=target){
      temp = temp.next;
    }
    newNode.next = temp!.next;
    temp.next = newNode;
  }
}
void main(){
  LinkedList a = LinkedList();
  a..addData(8)..addData(9)..addData(7)..addData(4);
  List b = [1,4,2,7,4];
  for (var i = 0; i < b.length; i++) {
   a.addData(b[i]);
    
  }
  a..display()..displayasarray()..revese()..display()..insertafter(1, 0)..insertBefore(1, 0)..display();
}