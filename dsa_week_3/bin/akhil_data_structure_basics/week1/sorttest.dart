class Node {
  int data;
  Node? next;
  Node(this.data);

}
class Linkedlist {
  Node? head;
   Node? tail;
   void addData(data){
    Node newNode = Node(data);
    if(head==null){
      head=newNode;
      tail=newNode;

    }else{
      tail!.next=newNode;
      tail = newNode;

    }

   }
   void view(){
    Node? temp = head;
    while (temp!=null ){
      print(temp.data);
      temp = temp.next;
    }
   }
   void toList(){
    List list = [];
     Node? temp = head;
     while(temp!=null){
      list.add(temp.data);
      temp=temp.next;
     }
     print(list);
   }
   void reverse(){
    Node? current = head;
    Node? next;
    Node? prev;
    while(current!=null){
      next = current.next;
      current.next = prev;
      prev = current;
      current =next;
    }
    head = prev;
   }
   void addNext(int target, int value){
    Node? current = head;
    if(current == null ){
      return;
    }
    Node newNode =Node(value);
    while (current!=null&& current.data!=target) {
      current = current.next;
      
    }
    if (current == null){
      print('no target found');
      return;
    }
    if (current.data==target){
      newNode.next = current.next;
      current.next=newNode;
    }

   }
   void addprev(int target , int value){
    Node newNode =Node(value);
    
    if (head == null){
      print('empty ');
      return;
    }
    if(head!.data==target){
      newNode.next = head;
      head = newNode;
      return;

    }
    Node? current = head;
    while (current!=null &&current.next!.data!=target) {
      current = current.next;
      
    }
    


   }
  

}
void main(List<String> args) {
  Linkedlist a = Linkedlist();
  a..addData(5)..addData(6)..addData(9)..addData(4)..view()..toList()..reverse()..view()..addNext(9, 0)..view();

}