class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinarySearchTree {
  TreeNode? root;

  // BinarySearchTree();

  void insert(int value) {
    TreeNode newNode = TreeNode(value);
    if (root == null) {
      root = newNode;
      return;
    }

    TreeNode? current = root;
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

  bool search(int value) {
    TreeNode? current = root;
    while (current != null) {
      if (value == current.value) {
        return true;
      } else if (value < current.value) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return false;
  }

  void inorder() {
    List<int> result = [];
    TreeNode? current = root;
    List<TreeNode?> stack = [];

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }
      current = stack.removeLast();
      result.add(current!.value);
      current = current.right;
    }

    print("Inorder traversal of the binary search tree:");
    result.forEach((value) => print(value));
  }
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
  bst.insert(7);
  bst.insert(13);

  bst.inorder();

  print("Searching for value 6: ${bst.search(6)}");
  print("Searching for value 11: ${bst.search(11)}");
}
