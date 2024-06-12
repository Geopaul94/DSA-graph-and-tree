
class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BinarySearchTree {
  Node? root;

  void insert(int value) {
    Node newNode = Node(value);
    if (root == null) {
      root = newNode;
      return;
    }

    Node? current = root;
    while (true) {
      if (value < current!.value) {
        if (current.left == null) {
          current.left = newNode;
          break;
        } else {
          current = current.left;
        }
      } else if (value > current.value) {
        if (current.right == null) {
          current.right = newNode;
          break;
        } else {
          current = current.right;
        }
      } else {
        // If the value already exists in the tree, do nothing
        break;
      }
    }
  }

  // Inorder Traversal without Recursion
  void inorder() {
    if (root == null) return;

    List<int> result = [];
    Stack<Node> stack = Stack();
    Node? current = root;

    while (current != null || !stack.isEmpty) {
      while (current != null) {
        stack.push(current);
        current = current.left;
      }
      
      current = stack.pop();
      result.add(current!.value);
      current = current.right;
    }

    print("Inorder traversal:");
    result.forEach((value) => print(value));
  }

  // Preorder Traversal without Recursion
  void preorder() {
    if (root == null) return;

    List<int> result = [];
    Stack<Node> stack = Stack();
    stack.push(root!);

    while (!stack.isEmpty) {
      Node node = stack.pop()!;
      result.add(node.value);
      
      if (node.right != null) stack.push(node.right!);
      if (node.left != null) stack.push(node.left!);
    }

    print("Preorder traversal:");
    result.forEach((value) => print(value));
  }

  // Postorder Traversal without Recursion
  void postorder() {
    if (root == null) return;

    List<int> result = [];
    Stack<Node> stack = Stack();
    stack.push(root!);

    while (!stack.isEmpty) {
      Node node = stack.pop()!;
      result.insert(0, node.value);
      
      if (node.left != null) stack.push(node.left!);
      if (node.right != null) stack.push(node.right!);
    }

    print("Postorder traversal:");
    result.forEach((value) => print(value));
  }

  // Delete a node from the tree
  void delete(int value) {
    root = _deleteRec(root, value);
  }

  Node? _deleteRec(Node? root, int value) {
    if (root == null) return root;

    // Search for the node to be deleted
    if (value < root.value) {
      root.left = _deleteRec(root.left, value);
    } else if (value > root.value) {
      root.right = _deleteRec(root.right, value);
    } else {
      // Node to be deleted is found

      // Case 1: Node with only one child or no child
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }

      // Case 2: Node with two children
      // Find the inorder successor (smallest node in the right subtree)
      root.value = _minValue(root.right!);

      // Delete the inorder successor
      root.right = _deleteRec(root.right, root.value);
    }
    return root;
  }

  int _minValue(Node node) {
    int minValue = node.value;
    while (node.left != null) {
      minValue = node.left!.value;
      node = node.left!;
    }
    return minValue;
  }
}

// Stack implementation
class Stack<T> {
  List<T> _stack = [];

  void push(T item) {
    _stack.add(item);
  }

  T? pop() {
    if (isEmpty) return null;
    return _stack.removeLast();
  }

  bool get isEmpty => _stack.isEmpty;
}

void main() {
  var bst = BinarySearchTree();
  bst.insert(8);
  bst.insert(3);
  bst.insert(10);
  bst.insert(1);
  bst.insert(6);
  bst.insert(14);
  bst.insert(4);
  bst.insert(7);
  bst.insert(13);

  bst.inorder();
  bst.preorder();
  bst.postorder();

  // Delete node 6
  bst.delete(6);
  print("\nAfter deleting node 6:");
  bst.inorder();
}
