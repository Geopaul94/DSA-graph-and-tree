class TreeNode {
  late int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;

  // Helper function to perform inorder traversal and check if the sequence is sorted
  bool isvalid(TreeNode? node, List<int> inorder) {
    if (node == null) return true;

    // Recursively check the left subtree
    if (!isvalid(node.left, inorder)) return false;

    // Check if the current node's value is greater than the previous node's value
    if (inorder.isNotEmpty && node.value <= inorder.last) return false;

    inorder.add(node.value); // Add the current node's value to the inorder list

    // Recursively check the right subtree

    return isvalid(node.right, inorder);
  }

  // Validate whether the given tree is a BST or not

  bool isValidBST(TreeNode? node) {
    return isvalid(node, []);
  }
}

void main() {
  // Create a binary tree
  var tree = BinaryTree();
   tree.root = TreeNode(5);
  tree.root!.left = TreeNode(6);
  tree.root!.right = TreeNode(7);
  tree.root!.left!.left = TreeNode(1);
  tree.root!.left!.right = TreeNode(4);
  tree.root!.right!.left = TreeNode(10);
  tree.root!.right!.right = TreeNode(8);

 
 // Validate whether the tree is a BST or not
  bool isBST = tree.isValidBST(tree.root);

  print('Is the given tree a BST? $isBST');
}