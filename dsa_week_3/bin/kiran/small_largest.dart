class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

class BST {
  Node? root;

  bool isEmpty() {
    return root == null;
  }

  void insert(int value) {
    Node newNode = Node(value);
    if (isEmpty()) {
      root = newNode;
    } else {
      _insertNode(root!, newNode);
    }
  }

  void _insertNode(Node root, Node newNode) {
    if (newNode.value < root.value) {
      if (root.left == null) {
        root.left = newNode;
      } else {
        _insertNode(root.left!, newNode);
      }
    } else {
      if (root.right == null) {
        root.right = newNode;
      } else {
        _insertNode(root.right!, newNode);
      }
    }
  }

  int max([Node? root]) {
    root ??= this.root;
    if (root!.right != null) {
      return max(root.right);
    } else {
      print(root.value);
      return root.value;
    }
  }

  int min([Node? root]) {
    root ??= this.root;
    if (root!.left == null) {
      return root.value;
    } else {
      print(root.value);
      return min(root.left);
    }
  }

  void delete(int value) {
    root = _deleteNode(root, value);
  }

  Node? _deleteNode(Node? root, int value) {
    if (root == null) {
      return root;
    }
    if (value < root.value) {
      root.left = _deleteNode(root.left, value);
    } else if (value > root.value) {
      root.right = _deleteNode(root.right, value);
    } else {
      if (root.left == null && root.right == null) {
        return null;
      }
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      root.value = min(root.right);
      root.right = _deleteNode(root.right, root.value);
    }
    return root;
  }

  void preOrderDFS({Node? root}) {
    if (root == null) {
      return;
    } else {
      print(root.value);
      preOrderDFS(root: root.left);
      preOrderDFS(root: root.right);
    }
  }


  void postOrderDFS([Node? root]) {
    root ??= this.root;
    if (root != null) {
      postOrderDFS(root.left);
      postOrderDFS(root.right);
      print(root.value);
    }
  }

  void inOrderDFS([Node? root]) {
    root ??= this.root;
    if (root != null) {
      inOrderDFS(root.left);
      print(root.value);
      inOrderDFS(root.right);
    }
  }

  // ignore: non_constant_identifier_names
  void BFS() {
    List<Node?> queue = [];
    queue.add(root);
    while (queue.isNotEmpty) {
      Node? curr = queue.removeAt(0);
      print(curr!.value);
      if (curr.left != null) {
        queue.add(curr.left);
      }
      if (curr.right != null) {
        queue.add(curr.right);
      }
    }
  }

  bool contains(Node? root, int value) {
    if (root == null) {
      return false;
    }
    if (value == root.value) {
      return true;
    }
    if (value < root.value) {
      return contains(root.left, value);
    }
    if (value > root.value) {
      return contains(root.right, value);
    }
    return false;
  }
}

bool isBST(BST tree, [int min = -99999999, int max = 99999999]) {
  Node? root = tree.root;
  if (root == null) {
    return true;
  }
  if (root.value < min || root.value > max) {
    return false;
  }
  return isBST(tree, min, root.value) && isBST(tree, root.value, max);
}

bool isIdentical(Node? root1, Node? root2) {
  if (root1 == null && root2 == null) {
    return true;
  } else if (root1 == null || root2 == null) {
    return false;
  } else {
    return root1.value == root2.value &&
        isIdentical(root1.left, root2.left) &&
        isIdentical(root1.right, root2.right);
  }
}

int height(Node? root) {
  if (root == null) {
    return -1;
  }
  int leftHeight = height(root.left);
  int rightHeight = height(root.right);
  return (leftHeight > rightHeight ? leftHeight : rightHeight) + 1;
}

void main() {
  BST bst = BST();
  bst.insert(2);
  bst.insert(9);

  bst.insert(3);
  bst.insert(1);
  bst.insert(4);

  BST bst1 = BST();
  bst1.insert(2);
  bst1.insert(9);
  bst1.insert(3);
  bst1.insert(1);
  bst1.insert(4);
  bst.max();
  bst.min();

  print("Preorder traversal:");
  bst.preOrderDFS(root: bst.root);
  print("");

  // Printing Postorder traversal
  // print("Postorder traversal:");
  // bst.postOrderDFS();
  // print("");

  // // Printing Inorder traversal
  // print("Inorder traversal:");
  // bst.inOrderDFS();

  // print(isIdentical(bst.root, bst1.root)); // Prints: true
  // print(height(bst.root)); // Prints: 2
}
