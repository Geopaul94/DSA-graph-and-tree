class Treenode {
  Treenode? left;
  Treenode? right;
  int? value;
  Treenode(this.value);
}

class BST {
  Treenode? root;
  void insert(int value) {
    root = insertR(root, value);
  }

  Treenode? insertR(Treenode? root, int? value) {
    if (root!.value == null) {
      return root;
    }

    if (value! < root.value!) {
      root.left = insertR(root.left, value);
    }
    if (value > root.value!) {
      root.right = insertR(root.right, value);
    }
    return root;
  }

  void delete(int value) {
    root = deleteR(root, value);
  }

  Treenode? deleteR(Treenode? root, int? value) {
    if (root == null) {
      return root;
    }
    if (value! < root.value!) {
      root.left = deleteR(root.left, value);
    } else if (value > root.value!) {
      root.right = deleteR(root.right, value);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      root.value = minvalue(root.right!);
      root.right = deleteR(root.right, value);
    }
    return root;
  }

  int? minvalue(Treenode node) {
    int? minvalue = node.value;
    while (node.left != null) {
      minvalue = node.left!.value;
      node = node.left!;
    }

    return minvalue;
  }
}
