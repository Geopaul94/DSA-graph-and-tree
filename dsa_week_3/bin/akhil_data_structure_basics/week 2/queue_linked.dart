class Node{
   dynamic data;
   Node? next;
   Node(this.data);

}
class Queue{
  Node? head;
  Node? tail;
  void push (data){
    Node newNode = Node(data);
    if(head==null){
      head = newNode;
      tail=newNode;
      
    }else{
      tail?.next =newNode;
      tail = newNode;

    }



  }
  void display(){
    Node? temp = head;
    while (temp !=null){
      print (temp.data);
      temp = temp.next;
    }
  }
  pop(){
    if(head==null){
      print('stackUnderflow');
    }else{
      head=head?.next;
    }
    display();
  }
}
void main(){
  Queue a = Queue();
  a..push(0)..push(5)..push(1)..display();
  print("==================");
  a..pop();

}