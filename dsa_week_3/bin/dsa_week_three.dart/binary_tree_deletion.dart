import 'dart:collection';

class Node {
  late Node left;
  late Node right;
  late int key;

  Node(int key) {
    left = right = Node.Null();
    this.key = key;
  }

  Node.Null() {
    left = right = this;
    key = -1;
  }
}

class BinaryTree {
  late Node root;

  BinaryTree() {
    root = Node(-1); // Initialize with a null node
  }

  void inorder(Node? temp) {
    if (temp == null || temp.key == -1) return;

    inorder(temp.left);
    print('${temp.key} ');
    inorder(temp.right);
  }

  void deleteDeepest(Node root, Node delNode) {
    Queue<Node> q = Queue();
    q.add(root);

    Node temp = Node(-1);
    while (q.isNotEmpty) {
      temp = q.removeFirst();

      if (temp == delNode) {
        temp = Node(-1);
        return;
      }
      if (temp.right.key != -1) {
        if (temp.right == delNode) {
          temp.right = Node(-1);
          return;
        } else
          q.add(temp.right);
      }

      if (temp.left.key != -1) {
        if (temp.left == delNode) {
          temp.left = Node(-1);
          return;
        } else
          q.add(temp.left);
      }
    }
  }

  void deleteNode(Node root, int key) {
    if (root.key == -1) return;

    if (root.left.key == -1 && root.right.key == -1) {
      if (root.key == key) {
        root = Node(-1);
        return;
      } else
        return;
    }

    Queue<Node> q = Queue();
    q.add(root);
    Node temp = Node(-1);
    Node keyNode = Node(-1);

    while (q.isNotEmpty) {
      temp = q.removeFirst();

      if (temp.key == key) keyNode = temp;

      if (temp.left.key != -1) q.add(temp.left);
      if (temp.right.key != -1) q.add(temp.right);
    }

    if (keyNode.key != -1) {
      int x = temp.key;
      keyNode.key = x;
      deleteDeepest(root, temp);
    }
  }
}

void main() {
  BinaryTree bt = BinaryTree();
  bt.root = Node(10);
  bt.root.left = Node(11);
  bt.root.left.left = Node(7);
  bt.root.left.right = Node(12);
  bt.root.right = Node(9);
  bt.root.right.left = Node(15);
  bt.root.right.right = Node(8);

  print("Inorder traversal before deletion: ");
  bt.inorder(bt.root);

  int key = 11;
  bt.deleteNode(bt.root, key);

  print("\nInorder traversal after deletion: ");
  bt.inorder(bt.root);
}
