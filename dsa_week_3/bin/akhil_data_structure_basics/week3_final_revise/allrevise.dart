import 'dart:collection';

class TreeNode{
  int data;
  TreeNode? left,right;
  TreeNode(this.data);
}
class BinaryST{
  TreeNode? root;
  insert(data){
    if(root==null){
      root = TreeNode(data);
      
    }else{
      recursiveadd(root!,data);
    }

  }
  recursiveadd(TreeNode node,data){
    if(data<node.data){
      if(node.left==null){
        node.left=TreeNode(data);
      }else{
        recursiveadd(node.left!, data);
      }
    }else if(data>node.data){
      if(node.right==null){
        node.right=TreeNode(data);
      }else{
        recursiveadd(node.right!, data);
      }
    }
  }
  inorderPrinting(TreeNode? node){
    if(node!=null){
      inorderPrinting(node.left);
      print(node.data);
      inorderPrinting(node.right);
    }
  }
  bfs(TreeNode node){
    Queue newq = Queue();
    newq.add(node);
    while(newq.isNotEmpty){
      TreeNode current =newq.removeFirst();
      print(current.data);
      if(current.left!=null){
        newq.add(current.left);
      }if(current.right!=null){
        newq.add(current.right);
      }
    }

  }
  delete(data){
    root = deleterecursive(root,data);
  }
  deleterecursive(TreeNode? node,data){
    if (node==null){
      return null;
    }
    if(data<node.data){
      node.left=deleterecursive(node.left, data);
    }else if(data>node.data){
      node.right=deleterecursive(node.right, data);
    }else{
       if(node.left==null){
        return node.right;
       }else  if(node.right==null){
        return node.left;
       }
       node.data == minvalue(node.right!);
       node.right=deleterecursive(node.right, node.data);
    }

  }
  minvalue(TreeNode node){
    var minval = node.data;
    while(node.left!=null){
      minval=node.left!.data;
      node = node.left!;
    }
return minval;
  
}
}
main(){
  BinaryST b = BinaryST();
  b..insert(5)..insert(4)..insert(7)..insert(4)..inorderPrinting(b.root);
}

