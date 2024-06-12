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
    Node node = Node(value);
    if (isEmpty()) {
      root = node;
    } else {
      insertNode(root!, node);
    }
  }

  void insertNode(Node root, Node node) {
    if (node.value < root.value) {
      if (root.left == null) {
        root.left = node;
      } else {
        insertNode(root.left!, node);
      }
    } else {
      if (root.right == null) {
        root.right = node;
      } else {
        insertNode(root.right!, node);
      }
    }
  }

  int max([Node? root]) {
    root ??= this.root;
    if (root!.right != null) {
      return max(root.right);
    } else {
      return root.value;
    }
  }

  int min([Node? root]) {
    root ??= this.root;
    if (root!.left == null) {
      return root.value;
    } else {
      return min(root.left);
    }
  }

  Node? delete(int value) {
    root = deleteNode(root, value);
    return root;
  }

  Node? deleteNode(Node? root, int value) {
    if (root == null) {
      return root;
    }
    if (value < root.value) {
      root.left = deleteNode(root.left, value);
    } else if (value > root.value) {
      root.right = deleteNode(root.right, value);
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
      root.right = deleteNode(root.right, root.value);
    }
    return root;
  }

  void preOrderDFS([Node? root]) {
    root ??= this.root;
    if (root != null) {
      print(root.value);
      preOrderDFS(root.left);
      preOrderDFS(root.right);
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

  void BFS() {
    List<Node?> queue = [];
    if (root != null) queue.add(root);
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
    return false; // This line was modified from the JavaScript version to remove the incorrect return statement.
  }
}

bool isBST(BST tree, [int min = -2147483648, int max = 2147483647]) {
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
  return leftHeight > rightHeight ? leftHeight + 1 : rightHeight + 1;
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

  print(isIdentical(bst.root, bst1.root));
  print(height(bst.root));
}
