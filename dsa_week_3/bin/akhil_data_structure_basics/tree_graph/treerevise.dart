class TreeNode{
  dynamic data;
 TreeNode? left;
  TreeNode? right;
  TreeNode(this.data);

}
class BinarySearchTree{
  TreeNode? root;
  insert(data){
    TreeNode newNode = TreeNode(data);
    if(root ==null){
      root = newNode;
      return;
    }
    TreeNode? current = root;
    while (true){
      if (data<current!.data){
        if(current.left ==null){
          current.left = newNode;
          break;

        }else 
        {
          current=current.left;
        }

      }else if(data>current.data ){
        if(current.right==null){
          current.right=newNode;
          break;
        }else{
          current = current.right;
        }

      }else{
        break;
      }
    }
  }
  search(data){
    TreeNode? current = root;
    while (current!=null){
      if(data==current.data){
        return true;
      }else if(data<current.data){
        current=current.left;
      }else{
        current = current.right;
      }

    }
    return false;
  }
  inOrder(){
    
  }
}