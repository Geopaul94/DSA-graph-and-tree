class Node{
  dynamic data;
  Node? next ;
  Node (this.data);
}
class LinkedList{
  Node? head;
  Node? tail;
  void add(value){
    Node newNode = Node(value);
    if (head ==null){
      head = newNode;
      tail =newNode;
    }else{
      tail!.next = newNode;
      tail = newNode;
    }
  }
  void display(){
    Node?temp = head ;
    while (temp!=null) {
      print(temp.data);
      temp = temp.next;
    }
  }
  void LinkedtoArray(){
    List array = [];
  Node? temp = head;
  while (temp!=null) {
    array.add(temp.data);
    temp = temp.next;
  }
  print(array);
  }
  void reverse(){
    
    Node? temp = head;
    Node? next;
    Node? prev;
    while (temp != null){
      next = temp.next;
      temp.next= prev;
      prev = temp;
      temp = next;
    }
    head = prev;
    display();
  }
  void insertBefore(int target, int value){
    Node newNode =Node(value);
    if(head==null){
      print('empty');
      return;
    }
    if(head!.data==target){
      newNode.next = head;
      head = newNode;
      return;


    }
    Node? temp = head;
    while(temp != null && temp.next!.data!=target){
      temp = temp.next;
    }
    if(temp!.data ==null){
      print('no such target');
      return;
    }
    if(temp.next!.data==target){
      newNode.next = temp.next;
      temp.next = newNode;

    }
    // display();

  }
  void remove(target){
    Node? temp = head;
    Node? prev;
    if(head!.data==target){
      head =head?.next;
      return;
    }
    while(temp!=null&&temp.data!=target){
      prev= temp;
      temp = temp.next
;    }
if(temp!=null){
  prev!.next=temp.next;
  display();
}
  }
  void linear(target){
    Node? temp = head;
while(temp!=null){
  if(temp.data==target){
    print('value exist');
    break;
  }else{
    temp = temp.next;
  }
}if(temp==null){
   print('value not exist');
  
}

  }
  void insertAtIndex(index,val){
    Node? current = head;
    int currentindex = 0;
    while( current!=0){
      currentindex++;
      if(currentindex==index){
        break;
      }else{
        current=current!.next;
      }

    }
    if(current!=null){
      current.data = val;
    }
  }
}



void main(){
  LinkedList a =LinkedList();
  a..add(5)..add(3)..add(2)..LinkedtoArray()..insertBefore(2, 1)..remove(3)..remove(5)..display()..linear(2)..insertAtIndex(1, 9);
  print('test');
  a.display();
}