// Define a class for the tree node

class TreeNode {
  late int value;
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

  // Delete a node with a given value from the tree
  void delete(int value) {
    root = _deleteRecursive(root, value);
  }

  TreeNode? _deleteRecursive(TreeNode? node, int value) {
    if (node == null) {
      return null;
    }

    if (value < node.value) {
      node.leftChild = _deleteRecursive(node.leftChild, value);
    } else if (value > node.value) {
      node.rightChild = _deleteRecursive(node.rightChild, value);
    } else {
      // Node to be deleted found
      if (node.leftChild == null) {
        return node.rightChild;
      } else if (node.rightChild == null) {
        return node.leftChild;
      }

      // Node to be deleted has two children
      node.value = _minValue(node.rightChild!);
      node.rightChild = _deleteRecursive(node.rightChild, node.value);
    }

    return node;
  }

  int _minValue(TreeNode node) {
    var minValue = node.value;
    while (node.leftChild != null) {
      minValue = node.leftChild!.value;
      node = node.leftChild!;
    }
    return minValue;
  }
}


void main() {
  // Create a new binary tree
  var tree = BinaryTree();

  // Insert some values into the tree
  tree.insert(5);
  tree.insert(3);
  tree.insert(7);
  tree.insert(1);
  tree.insert(4);
  tree.insert(6);
  tree.insert(8);
  

  // Perform an in-order traversal of the tree and print the values
  print('In-order traversal before deletion:');
  tree.inOrderTraversal(tree.root);

  // Delete a node with value 3
  tree.delete(3);

  // Perform an in-order traversal of the tree after deletion and print the values
  print('In-order traversal after deletion:');
  tree.inOrderTraversal(tree.root);
}
