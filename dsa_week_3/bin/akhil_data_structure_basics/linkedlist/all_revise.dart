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
if (head==null){
  head = newNode;
  tail= newNode;
}else{
  tail!.next = newNode;
  tail = newNode;
}
  }


  void displayNode(){
    Node? temp = head;
    while (temp !=null){
      print(temp.data);
      temp = temp.next;
    }
  }
  void reverseNode(){
    Node? temp = head;
    Node? next;
    Node? prev;
    while(temp!=null){
      next= temp.next;
      temp.next = prev;
      prev =temp;
      temp = next;
    }
    head = prev;
  }
  void addAfter(target,value){
    if (head==null){
      return;

    }
    Node? temp= head;
    Node newNode = Node(value);
    while (temp!=null && temp.data !=target){
      temp=temp.next;
    }
    newNode.next=temp?.next;
    temp?.next =newNode;


  }
  void  inserBefore(target,value){
    Node newNode = Node(value);
if(head ==null){
   head = newNode;
   tail=newNode;
   return;
}
Node? temp = head;
while(temp!=null&&target!=temp.next?.data){
  temp = temp.next;
}
newNode.next = temp?.next;
temp?.next = newNode;

  }
  void delete(value){
    Node? temp = head;
    Node? prev;
    while(temp!=null&&temp.data!=value){
      prev= temp;
      temp= temp.next;

    }
    if(temp!=null){
      prev?.next = temp.next;
    }

  }
  void replaceAt(index,data){
int currentindex = 0;
Node? temp = head;

while(temp!=null){
  currentindex++;
  if(currentindex==index){
    break;
  }
  
  temp = temp.next;

}
temp?.data = data;
    
  }
  void deleteIndex(index){
    int currentindex = 0 ;
      Node? prev;
    Node? temp = head;
    while (temp!=null){
      currentindex++;
      
      if(currentindex==index){
      break;
      }
      prev =temp;
      temp = temp.next;
    }

prev?.next = temp?.next;
  }
  void sum(){
    dynamic c = 0;
    Node? temp = head;
    while (temp!=null){
       c=  c + temp.data;
      temp = temp.next;
    }
    print (c);
  }
}
void main(List<String> args) {
  List a = [1,2,3,4,5,3];
  LinkedList linkedList = LinkedList();
  for (var i = 0; i < a.length; i++) {
    linkedList.addData(a[i]);
    
  }
  // linkedList..displayNode()..reverseNode();
  // print('======================');
  linkedList..displayNode()..replaceAt(2,9);
  print('======================');
   linkedList..displayNode()..sum();
}