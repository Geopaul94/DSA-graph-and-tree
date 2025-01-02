class TreeNode {
  late int value;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;

  // Insert a value into the binary search tree
  void insert(int value) {
    root = _insertRecursive(root, value);
  }

  TreeNode? _insertRecursive(TreeNode? node, int value) {
    if (node == null) {
      return TreeNode(value);
    }

    if (value < node.value) {
      node.left = _insertRecursive(node.left, value);
    } else {
      node.right = _insertRecursive(node.right, value);
    }

    return node;
  }

  // Find the closest value to the target value in the binary search tree
  int findClosestValue(TreeNode? node, int target) {
    int closest = node!.value;

    while (node != null) {
      if ((node.value - target).abs() < (closest - target).abs()) {
        closest = node.value;
      }

      if (target < node.value) {
        node = node.left;
      } else if (target > node.value) {
        node = node.right;
      } else {
        break; // Found an exact match
      }
    }

    return closest;
  }
}

void main() {
  // Create a binary search tree
  var tree = BinaryTree();
  tree.insert(10);
  tree.insert(5);
  tree.insert(15);
  tree.insert(2);
  tree.insert(7);
  tree.insert(12);
  tree.insert(17);

  // Find the closest value to the target value
  int target = 9;
  int closestValue = tree.findClosestValue(tree.root, target);

  print('Closest value to $target: $closestValue');
}
