import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.val);
}

void bfs(TreeNode root) {
  if (root == null) return;

  Queue<TreeNode> queue = Queue<TreeNode>();
  queue.add(root);

  while (queue.isNotEmpty) {
    TreeNode current = queue.removeFirst();
    print(current.val); // Print the value of the current node

    if (current.left == null) {
      queue.add(current.left!);
    }
    if (current.right == null) {
      queue.add(current.right!);
    }
  }
}

void main() {
  // Create a binary search tree
  TreeNode root = TreeNode(5);
  root.left = TreeNode(3);
  root.right = TreeNode(8);
  root.left!.left = TreeNode(1);
  root.left!.right = TreeNode(4);
  root.right!.left = TreeNode(7);
  root.right!.right = TreeNode(9);

  // Print BST nodes using BFS
  bfs(root);
}
