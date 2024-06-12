class TreeNode {
  int value;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.value);
}

class BinarySearchTree {
  TreeNode? root;

  void insert(int value) {
    root = _insertRec(root, value);
  }

  TreeNode? _insertRec(TreeNode? root, int value) {
    if (root == null) {
      return TreeNode(value);
    }

    if (value < root.value) {
      root.left = _insertRec(root.left, value);
    } else if (value > root.value) {
      root.right = _insertRec(root.right, value);
    }

    return root;
  }

  // Inorder Traversal with Recursion
  void inorder() {
    print("Inorder traversal:");
    _inorderRec(root);
  }

  void _inorderRec(TreeNode? root) {
    if (root != null) {
      _inorderRec(root.left);
      print(root.value);  
      _inorderRec(root.right);
    }
  }

  // Preorder Traversal with Recursion
  void preorder() {
    print("Preorder traversal:");
    _preorderRec(root);
  }

  void _preorderRec(TreeNode? TreeNode) {
    if (TreeNode != null) {
      print(TreeNode.value);
      _preorderRec(TreeNode.left);
      _preorderRec(TreeNode.right);
    }
  }

  // Postorder Traversal with Recursion
  void postorder() {
    print("Postorder traversal:");
    _postorderRec(root);
  }

  void _postorderRec(TreeNode? TreeNode) {
    if (TreeNode != null) {
      _postorderRec(TreeNode.left);
      _postorderRec(TreeNode.right);
      print(TreeNode.value);
    }
  }

  // Delete a TreeNode from the tree
  void delete(int value) {
    root = _deleteRec(root, value);
  }

  TreeNode? _deleteRec(TreeNode? root, int value) {
    if (root == null) {
      return root;
    }
    if (value < root.value) {
      root.left = _deleteRec(root.left, value);
    } else if (value > root.value) {
      root.right = _deleteRec(root.right, value);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      root.value = _minValue(root.right!);
      root.right = _deleteRec(root.right, root.value);
    }
    return root;
  }

  int _minValue(TreeNode TreeNode) {
    int minValue = TreeNode.value;
    while (TreeNode.left != null) {
      minValue = TreeNode.left!.value;
      TreeNode = TreeNode.left!;
    }
    print("minimu, value $minValue");
    return minValue;
  }

  int findSmallestValue(TreeNode node) {
    if (node.left == null) {
      return node.value;
    }
    return findSmallestValue(node.left!);
  }

  // Function to find the largest value in the tree
  int findLargestValue(TreeNode node) {
    if (node.right == null) {
      return node.value;
    }
    return findLargestValue(node.right!);
  }

  int maxHeight(TreeNode? node) {
    if (node == null) return -1;
    int leftHeight = maxHeight(node.left);
    int rightHeight = maxHeight(node.right);
    return (leftHeight > rightHeight) ? leftHeight + 1 : rightHeight + 1;
  }

  // Function to check if the tree is balanced
  bool isBalanced(TreeNode? node) {
    if (node == null) return true;
    int leftHeight = maxHeight(node.left);
    int rightHeight = maxHeight(node.right);
    if (isBalanced(node.left) &&
        isBalanced(node.right) &&
        (leftHeight - rightHeight).abs() <= 1) {
      return true;
    }
    return false;
  }

  // Function to check if the tree is a binary search tree (BST)
  bool isBST(TreeNode? node, int? min, int? max) {
    if (node == null) return true;
    if ((min != null && node.value <= min) ||
        (max != null && node.value >= max)) {
      return false;
    }
    return isBST(node.left, min, node.value) &&
        isBST(node.right, node.value, max);
  }

  // Function to check if two trees are symmetric
  bool isSymmetric(TreeNode? root1, TreeNode? root2) {
    if (root1 == null && root2 == null) {
      return true;
    }
    if (root1 == null || root2 == null || root1.value != root2.value) {
      return false;
    }
    return isSymmetric(root1.left, root2.right) &&
        isSymmetric(root1.right, root2.left);
  }
}

void main() {
  var bst = BinarySearchTree();
  bst.insert(9);
  bst.insert(3);
  bst.insert(1);
  bst.insert(4);
  bst.insert(11);
  bst.insert(10);
  bst.insert(12);

  bst.insert(13);
  bst.insert(15);
  bst.insert(16);
  bst.inorder();
  bst.preorder();
  bst.postorder();

  // Delete TreeNode 6
  bst.delete(6);
  print("\nAfter deleting TreeNode 6:");
  bst.inorder();

  print('1111111111111111111111111111');
  print("Maximum Height: ${bst.maxHeight(bst.root)}");
  print("Is Balanced Tree: ${bst.isBalanced(bst.root)}");
  print("Is Binary Search Tree: ${bst.isBST(bst.root, null, null)}");
//  print("Is Binary symmetric  Tree: ${bst.isSymmetric(bst.root, null, null)}");

  print('55555555555555555555555555');
  int v = bst.findSmallestValue(bst.root!);
  int k = bst.findLargestValue(bst.root!);
  print("Smallest Value: ${bst.findSmallestValue(bst.root!)}");
  print("Largest Value: ${bst.findLargestValue(bst.root!)}");
  print(v + k);
}
