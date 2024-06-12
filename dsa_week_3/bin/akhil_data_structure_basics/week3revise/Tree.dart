class TreeNode{
  int data;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.data);
}
class BinarySearchTree{
  TreeNode? root;
  addData(value){
    if(root==null){
      root = TreeNode(value);

    }else{
      recusriveAdd(root!,value);
    }
  }
  recusriveAdd(TreeNode node,value){
    if(value<node.data){
      if(node.left==null){
        node.left=TreeNode(value);
      }else{
        recusriveAdd(node.left!, value);
      }
    }else{
      if(node.right==null){
        node.right=TreeNode(value);
      }else{
        recusriveAdd(node.right!, value);
      }
    }
  }
  display(TreeNode? node){
    
    if(node!=null){
      display(node.left);
 
      print(node.data);
      display(node.right);
    }

  }
  sortedList(TreeNode? node){
    List result = [];
    if(node!=null){
      result.addAll(sortedList(node.left));
      result.add(node.data);
      result.addAll(sortedList(node.right));

    }
    return result;

  }
  isBstOrNOt(TreeNode? node){
    List test = sortedList(node);
    for (var i = 1; i < test.length; i++) {
      if(test[i]<=test[i-1]){
        return false;
      }
    }
    
     return   true;
      
  }
  void preOrderDisplay(TreeNode? node) {
    if (node != null) {
      print(node.data);
      preOrderDisplay(node.left);
      preOrderDisplay(node.right);
    }
  }

  // Function for post-order traversal display
  void postOrderDisplay(TreeNode? node) {
    if (node != null) {
      postOrderDisplay(node.left);
      postOrderDisplay(node.right);
      print(node.data);
    }
  }
}
void main(List<String> args) {
  var tree = BinarySearchTree();
  tree..addData(5)..addData(8)..addData(1)..addData(13)..addData(4)..addData(9)..display(tree.root);
  List a = tree.sortedList(tree.root);
  print(a);
  bool isBST = tree.isBstOrNOt(tree.root);

  print('Is the given tree a BST? $isBST');
}