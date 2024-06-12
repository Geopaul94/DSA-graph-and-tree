class Node {
  int key;
  Node? left;
  Node? right;

  Node(this.key);
}

Node insert(Node? node, int key) {
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

Node? search(Node? root, int key) {
  if (root == null || root.key == key) {
    return root;
  }

  if (root.key < key) {
    return search(root.right, key);
  }

  return search(root.left, key);
}

void main() {
  // Example usage:
  var root = Node(10);
  insert(root, 5);
  insert(root, 15);
  insert(root, 3);
  insert(root, 8);
    insert(root, 2);
  insert(root, 17);
  insert(root, 13);
  insert(root, 14);

  var searchResult = search(root, 8);
  if (searchResult != null) {
    print("Key found: ${searchResult.key}");
  } else {
    print("Key not found");
  }
}
