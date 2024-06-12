// Dart Program for the above approach

// A binary tree node has data, pointer to left child
// and a pointer to right child
class Node {
  double data;
  Node? left;
  Node? right;

  Node(this.data);
}

// Helper function that allocates a new node with the
// given data and NULL left and right pointers.
Node newNode(double data) {
  return Node(data);
}

double maxValue(Node? node) {
  if (node == null) return double.negativeInfinity;

  double value = node.data;
  double leftMax = maxValue(node.left);
  double rightMax = maxValue(node.right);

  return value > leftMax ? (value > rightMax ? value : rightMax) : (leftMax > rightMax ? leftMax : rightMax);
}

double minValue(Node? node) {
  if (node == null) return double.infinity;

  double value = node.data;
  double leftMin = minValue(node.left);
  double rightMin = minValue(node.right);

  return value < leftMin ? (value < rightMin ? value : rightMin) : (leftMin < rightMin ? leftMin : rightMin);
}

// Returns true if a binary tree is a binary search tree
int isBST(Node? node) {
  if (node == null) return 1;

  // false if the max of the left is > than us
  if (node.left != null && maxValue(node.left) > node.data) return 0;

  // false if the min of the right is <= than us
  if (node.right != null && minValue(node.right) < node.data) return 0;

  // false if, recursively, the left or right is not a BST
  if (isBST(node.left) != 1 || isBST(node.right) != 1) return 0;

  // passing all that, it's a BST
  return 1;
}

// Driver code
void main() {
  Node root = newNode(4);
  root.left = newNode(2);
  root.right = newNode(5 );

  // root.right.left = newNode(7);
  root.left!.left = newNode(1);
  root.left!.right = newNode(3);

  // Function call
  if (isBST(root) == 1)
    print("Is BST");
  else
    print("Not a BST");
}
