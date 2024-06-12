class TrieNode {
  int? value;
  TrieNode? left;
  TrieNode? right;
  TrieNode(this.value);
}

class BST {
  TrieNode? root;

  void insert(int value) {
    root = insertR(root, value);
  }

  TrieNode? insertR(TrieNode? root, int? value) {
    if (root == null) {
      return TrieNode(value);
    }
    if (value! < root.value!) {
      root.left = insertR(root.left, value);
    }
    if (value > root.value!) {
      root.right = insertR(root.right, value);
    }

    return root;
  }

  void inorder() {
    print('inorder traverse');
    inorderR(root);
  }

  inorderR(TrieNode? root) {
    if (root != null) {
      inorderR(root.left);
      print(root.value);
      inorderR(root.right);
    }
  }

  void preorder() {
    print('preorder traverse ');
    preorderR(root!);
  }

  preorderR(TrieNode? root) {
    if (root != null) {
      print(root.value);
      preorderR(root.left);
      preorderR(root.right);
    }
  }

  void postorder() {
    print('postorder traversal ');
    postorderR(root);
  }

  postorderR(TrieNode? root) {
    if (root != null) {
      postorderR(root.left);
      postorderR(root.right);
      print(root.value);
    }
  }

  printR() {
    dynamic k = root!.value;
    print('root value $k');
  }

  int findsmallestnumber(TrieNode root) {
    if (root.left == null) {
      print(root.value!);
      return root.value!;
    }

    return findsmallestnumber(root.left!);
  }

  int findSmallestValue(TrieNode node) {
    if (node.left == null) {
      return node.value!;
    }
    return findSmallestValue(node.left!);
  }

  int findLargeestnumber(TrieNode root) {
    if (root.right == null) {
      print('largest number : ${root.value}');
      return root.value!;
    }
    return findLargeestnumber(root.right!);
  }

  void delete(int value) {
    root = deleteR(root, value);
  }

  TrieNode? deleteR(TrieNode? root, int value) {
    if (root == null) {
      return root;
    }
    if (value < root.value!) {
      root.right = deleteR(root.right, value);
    }
    if (value > root.value!) {
      root.left = deleteR(root.left!, value);
    }
    if (root.left == null) {
      return root.right;
    }
    if (root.right == null) {
      return root.left;
    }
    root.value = _minValue(root.right!);
    root.right = deleteR(root.right!, root.value!);
    return root;
  }

  int? _minValue(TrieNode node) {
    int minvalue = node.value!;
    while (node.left != null) {
      node = node.left!;
    }
    return minvalue;
  }

  int maxheight(TrieNode? node) {
    if (node == null) {
      return -1;
    }
    int? leftheight = maxheight(node.left);
    int? rightheight = maxheight(node.right);
    return (leftheight < rightheight) ? leftheight + 1 : rightheight + 1;
  }

  bool isBalanced(TrieNode? node) {
    if (node == null) {
      return true;
    }
    int rightheight = maxheight(node.right);
    int leftheight = maxheight(node.left);

    if (isBalanced(node.left) &&
        isBalanced(node.right) &&
        (leftheight - rightheight).abs() <= 1) {
      return true;
    }

    return false;
  }

  bool isbbb(TrieNode? node) {
    if (root == null) {
      return true;
    }
    int leftheight = maxheight(node!.left);
    int rightheight = maxheight(node.right);
    if (isbbb(node.left) &&
        isbbb(node.right) &&
        (leftheight - rightheight).abs() <= 1) {
      return true;
    }
    return false;
  }
}

void main() {
  BST bst = BST();
  bst.insert(20);
  bst.insert(5);
  bst.insert(4);
  bst.insert(6);
  bst.insert(8);
  bst.insert(3);
  bst.insert(7);
  bst.insert(6);
  bst.inorder();
  bst.postorder();
  bst.preorder();
  bst.printR();
  print('print smallest value : ${bst.findSmallestValue(bst.root!)}');
  bst.findsmallestnumber(bst.root!);
  bst.findLargeestnumber(bst.root!);
  bst.delete(5);
  bst.inorder();
  print('maxheight ${bst.maxheight(bst.root!)}');
}
