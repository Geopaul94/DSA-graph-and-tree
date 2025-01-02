
class TreeNode {
   int value;
  TreeNode? leftChild;
  TreeNode? rightChild;

  TreeNode(this.value);
}

// Define a class for the binary tree


class BinaryTree {
  TreeNode? root;

  // Insert a new value into the tree


  
  void insert(int value) {
    if (root == null) {
      root = TreeNode(value);
    } else {
      _insertRecursive(root!, value);
    }
  }

  void _insertRecursive(TreeNode node, int value) {
    if (value < node.value) {
      if (node.leftChild == null) {
        node.leftChild = TreeNode(value);
      } else {
        _insertRecursive(node.leftChild!, value);
      }
    } else {
      if (node.rightChild == null) {
        node.rightChild = TreeNode(value);
      } else {
        _insertRecursive(node.rightChild!, value);
      }
    }
  }

  // Perform an in-order traversal of the tree
  void inOrderTraversal(TreeNode? node) {
    if (node != null) {
      inOrderTraversal(node.leftChild);
      print(node.value);
      inOrderTraversal(node.rightChild);
    }
  }
}

void main() {

  var tree = BinaryTree();


  tree.insert(5);
  tree.insert(3);
  tree.insert(7);
  tree.insert(1);
  tree.insert(4);
  tree.insert(6);
  tree.insert(8);


  print('In-order traversal:');
  tree.inOrderTraversal(tree.root);
}
