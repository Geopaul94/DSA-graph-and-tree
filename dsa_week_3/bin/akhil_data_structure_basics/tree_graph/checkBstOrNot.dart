class TreeNode {
  late int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;

  // Perform inorder traversal of the binary tree
  List<int> inorderTraversal(TreeNode? node) {
    List<int> result = [];
    if (node != null) {
      result.addAll(inorderTraversal(node.left));
      result.add(node.value);
      result.addAll(inorderTraversal(node.right));
    }
    return result;
  }

  // Validate whether the given tree is a BST or not
  bool isValidBST(TreeNode? node) {
    List<int> inorder = inorderTraversal(node);
    for (int i = 1; i < inorder.length; i++) {
      if (inorder[i] <= inorder[i - 1]) {
        return false;
      }
    }
    return true;
  }
}

void main() {
  // Create a binary tree
  var tree = BinaryTree();
  tree.root = TreeNode(10);
  tree.root!.left = TreeNode(5);
  tree.root!.right = TreeNode(15);
  tree.root!.left!.left = TreeNode(2);
  tree.root!.left!.right = TreeNode(7);

  // Validate whether the tree is a BST or not
  bool isBST = tree.isValidBST(tree.root);

  print('Is the given tree a BST? $isBST');
}
