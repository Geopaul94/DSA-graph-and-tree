class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinarySearchTree {
  TreeNode? root;

  BinarySearchTree();

  void insert(int value) {
    root = _insertRec(root, value);
  }

  TreeNode _insertRec(TreeNode? node, int value) {
    if (node == null) {
      return TreeNode(value);
    }

    if (value < node.value) {
      node.left = _insertRec(node.left, value);
    } else if (value > node.value) {
      node.right = _insertRec(node.right, value);
    }

    return node;
  }

  bool search(int value) {
    return _searchRec(root, value);
  }

  bool _searchRec(TreeNode? node, int value) {
    if (node == null) {
      return false;
    }

    if (value == node.value) {
      return true;
    }

    if (value < node.value) {
      return _searchRec(node.left, value);
    } else {
      return _searchRec(node.right, value);
    }
  }

  void inorder() {
    _inorderRec(root);
  }

  void _inorderRec(TreeNode? node) {
    if (node != null) {
      _inorderRec(node.left);
      print(node.value);
      _inorderRec(node.right);
    }
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
  bst.insert(13);

  print("Inorder traversal of the binary search tree:");
  bst.inorder();

  print("Searching for value 6: ${bst.search(6)}");
  print("Searching for value 11: ${bst.search(11)}");
}
