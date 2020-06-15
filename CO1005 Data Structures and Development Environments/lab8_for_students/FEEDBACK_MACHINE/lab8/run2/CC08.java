import java.util.*;

// see also the MyNode.java file!

public class CC08 {

  MyNode example_tree() {
    return node(leaf(0),0,leaf(0));
  }

  int size(MyNode n) {
	  if(isLeaf(n)){
		  return 1;
	  };
	  return size(n.left) + size(n.right) + 1;
  }
  
  int height(MyNode n) {
	  if(isLeaf(n)) {
		  return 1;
	  }
	  return Math.max(height(n.right),height(n.left)) + 1;
  }

  boolean is_binary_search_tree(MyNode n) {
    return false; // FIXME
  }



  // tree functions ----------------------------------------

  // from lectures

  MyNode node(MyNode l, Object o, MyNode r) {
    return new MyNode(l,o,r);
  }
  
  MyNode leaf(Object o) {
    return new MyNode(null,o,null);
  }
  
  boolean isLeaf(MyNode n) {
    return (n.left == null) && (n.right == null);
  }
  
  boolean isNode(MyNode n) {
    return !(isLeaf(n));
  }

  
}
