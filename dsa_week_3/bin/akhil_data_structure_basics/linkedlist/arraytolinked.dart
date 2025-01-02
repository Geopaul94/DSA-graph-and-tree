class Node{
  dynamic data;
  Node? next;
  Node(this.data);

}
class LinkedList{
  Node? head;
  Node? tail;
  void addData(data){
    Node newNode = Node(data);
    if (head ==null){
      head =newNode;
      tail=newNode;
    }else{
      tail!.next=newNode;
      tail=newNode;
    }
  }
  void display(){
    Node?temp = head; 
    while (temp !=null){
      print(temp.data);
      temp = temp.next;
    }
  }
  void toarr(){
    List convert =[];
    Node? temp = head;
    while (temp!=null){
      convert.add(temp.data);
      temp = temp.next;
    }
    print(convert);
  }
}
void main() {
  List values = [1,2,8,7,9];
    LinkedList a = LinkedList();
    for(int i =0;i<values.length;i++){
      a.addData(values[i]);
    }

  a.display();
  a.toarr();
  
}