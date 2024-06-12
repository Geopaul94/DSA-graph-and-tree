// class Node {
//   int key;
//   Node? left;
//   Node? right;

//   Node(this.key);
// }

// Node? insert(Node? node, int key) {
//   if (node == null) {
//     return Node(key);
//   }

//   if (key < node.key) {
//     node.left = insert(node.left, key);
//   } else if (key > node.key) {
//     node.right = insert(node.right, key);
//   }

//   return node;
// }

// // Function to print the binary search tree in an in-order traversal
// void printTreeInOrder(Node? node, String indent, bool last) {
//   if (node != null) {
//     print(indent + (last ? '└── ' : '├── ') + '${node.key}');
//     printTreeInOrder(node.left, indent + (last ? '    ' : '│   '), false);
//     printTreeInOrder(node.right, indent + (last ? '    ' : '│   '), true);
//   }
// }

// void main() {
//   // Example usage:
//   Node? root;
//   root = insert(root, 10);
//   insert(root, 5);
//   insert(root, 15);
//   insert(root, 3);
//   insert(root, 7);
//   insert(root, 17);
//   insert(root, 16); // Adding 16 to the tree

//   // Print the tree
//   printTreeInOrder(root, '', true);
// }


class Node {
  int key;
  Node? left;
  Node? right;

  Node(this.key);
}

Node? insert(Node? node, int key) {
  if (node == null) {
    return Node(key);
  }

  if (key < node.key) {
    node.left = insert(node.left, key);
  } else if (key > node.key) {
    node.right = insert(node.right, key);
  }

  return node;
}

// Function to print the binary search tree in the desired format
void printTree(Node? node, String indent, bool last) {
  if (node != null) {
    print(indent + (last ? '└── ' : '├── ') + '${node.key}');
    if (node.left != null || node.right != null) {
      printTree(node.left, indent + (last ? '    ' : '│   '), false);
      printTree(node.right, indent + (last ? '    ' : '│   '), true);
    }
  }
}

void main() {
  // Example usage:
  Node? root;
  root = insert(root, 10);
  insert(root, 5);
  insert(root, 15);
  insert(root, 3);
  insert(root, 7);
  insert(root, 17);
  insert(root, 16);

  // Print the tree
  printTree(root, '', true);
}
