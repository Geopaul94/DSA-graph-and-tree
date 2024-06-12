class TreeNode{
  int data;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.data);
}
class BinaryST{
  TreeNode? root;
  addData(data){
    if(root==null){
      root =TreeNode(data);
    }else{
      recursiveadd(root,data);
    }

  }
  recursiveadd(TreeNode? node,data){
    if(data<node?.data){
      if(node?.left==null){
        node?.left =TreeNode(data);

      }else{
        recursiveadd(node?.left, data);
      }

    }else{
      if(node?.right==null){
        node?.right =TreeNode(data);

      }else{
        recursiveadd(node?.right, data);
      }
    }

  }
  inOrderPrinting(TreeNode? node){
    if(node!=null){
      inOrderPrinting(node.left);
      print(node.data);
      inOrderPrinting(node.right);
    }

  }
  inOrderTraversal(TreeNode? node){
    List result = [];
    if(node!=null){
      result.addAll(inOrderTraversal(node.left));
      result.add(node.data);
      result.addAll(inOrderTraversal(node.right));
    }
    return result;

  }

}
void main(){
  BinaryST a = BinaryST();
  a..addData(5)..addData(6)..addData(3)..addData(1)..inOrderPrinting(a.root);
  List b = a.inOrderTraversal(a.root);
  print(b);
}