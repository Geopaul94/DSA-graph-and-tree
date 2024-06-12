class Node {
  dynamic key;
  dynamic value;
  Node? next;
  
  Node(this.key, this.value);
}

class Hash {
  int? size;
  List<Node?>? table;
  
  Hash(int size) {
    this.size = size;
    this.table = List<Node?>.filled(size, null);
  }
  
  int _hashing(String key) {
    int total = 0;
    for (var i = 0; i < key.length; i++) {
      total += key.codeUnitAt(i);
    }
    return total % size!;
  }
  
  void addData(String key, dynamic value) {
    int index = _hashing(key);
    if (table![index] == null) {
      // If no collision, create a new node
      table![index] = Node(key, value);
    } else {
      // If collision occurs, append to the existing linked list
      Node? currentNode = table![index];
      while (currentNode!.next != null) {
        currentNode = currentNode.next;
      }
      currentNode.next = Node(key, value);
    }
  }
  
  void display() {
    for (int i = 0; i < size!; i++) {
      print("Index $i:");
      Node? currentNode = table![i];
      while (currentNode != null) {
        print("  Key: ${currentNode.key}, Value: ${currentNode.value}");
        currentNode = currentNode.next;
      }
    }
  }
}

void main() {
  int size = 10;
  Hash newHash = Hash(size);
  newHash.addData('name', 'akhil');
  newHash.addData('age', 23);
  newHash.addData('city', 'New York');
  newHash.addData('country', 'USA');
  newHash.addData('language', 'Dart');
  newHash.addData('food', 'Pizza');
  newHash.addData('color', 'Blue');
  newHash.addData('school', 'XYZ');
  newHash.addData('team', 'ABC');
  newHash.addData('book', 'Science');
  newHash.display();
}
