import java.util.*;

public class CC08_soln {

  int size(MyNode n) {
    if(isLeaf(n)) return 1;
    return 1+size(n.left)+size(n.right);
  }

  int height(MyNode n) {
    if(isLeaf(n)) return 1;
    return 1+Math.max(height(n.left),height(n.right));
  }

  List nodes_less_than(MyNode t, int k) {
    List this_node;
    if(((Integer)t.obj) < k) 
      this_node=cons(t.obj,nil());
    else 
      this_node=nil();
    if(isLeaf(t)) return this_node;
    List left_nodes = nodes_less_than(t.left,k);
    List right_nodes = nodes_less_than(t.right,k);
    return append(left_nodes,append(this_node,right_nodes));
  }

  List nodes_greater_than(MyNode t, int k) {
    List this_node;
    if(((Integer)t.obj) > k) 
      this_node=cons(t.obj,nil());
    else 
      this_node=nil();
    if(isLeaf(t)) return this_node;
    List left_nodes = nodes_greater_than(t.left,k);
    List right_nodes = nodes_greater_than(t.right,k);
    return append(left_nodes,append(this_node,right_nodes));
  }

  // we assume each integer in the tree is unique (i.e. there are no
  // nodes decorated with the same integer)
  boolean is_binary_search_tree(MyNode n) {
    // this is very inefficient! search the web for a more efficient
    // version using extra parameters min and max
    if(isLeaf(n)) return true;
    int k = (Integer)(n.obj);
    List l = nodes_less_than(n.right,k);
    if(!l.isEmpty()) return false;
    l = nodes_greater_than(n.left,k);
    if(!l.isEmpty()) return false;
    return(is_binary_search_tree(n.left) && is_binary_search_tree(n.right));
  }


  // testing code
  void main() {
    MyNode t12 = node(leaf(1),"+",leaf(2));
    System.out.println("size passes test: "+(size(t12)==3));
    System.out.println("height passes test: "+(height(t12)==2));

    // the following is similar to the example from wikipedia
    MyNode binary_search_tree = 
      node(
           node(
                leaf(1),
                3,
                node(
                     leaf(4),
                     6,
                     leaf(7))),
           8,
           leaf(10));
    System.out.println(
                       "is_binary_search_tree passes test: "
                       +is_binary_search_tree(binary_search_tree));
  }

  public static void main(String[] args) {
    new CC08_soln().main();
  }





  //////////////////////////////////////////////////////////////////////
  // basic tree functions
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





  // most of the following methods could/should be static

  // clone is protected, so we could subclass but...  YOU ARE NOT
  // ALLOWED TO USE THIS FUNCTION!!! IT IS ONLY FOR IMPLEMENTING cons
  // ETC.
  List copy(List l0) {
    List to_return = new LinkedList();
    for(int i=0; i<l0.size(); i++) {
      to_return.add(i,l0.get(i));
    }
    return to_return;
  }

  // the empty list
  List nil() {
    return new LinkedList();
  }

  // add at front of list
  List cons(Object o, List l0) {
    List l = copy(l0);
    l.add(0,o);
    return l;
  }


  // head of the list
  Object hd(List l) { return l.get(0); }

  // tail of the list
  List tl(List l0) {
    List l = copy(l0);
    l.remove(0);
    return l;
  }

  // add at end of list
  List append1(List l0, Object o) {
    List l = copy(l0);
    l.add(l.size(),o);
    return l;
  }

  // join two lists together
  List append(List l01, List l02) {
    List to_return = copy(l01);
    List l2 = copy(l02);

    while(true) {
      if(l2.isEmpty()) return to_return;
      to_return=append1(to_return,hd(l2));
      l2=tl(l2);
    }

  }

  // for debugging
  String asString(List l) {
    String to_return ="[";
    while(true) {
      if(l.isEmpty()) return (to_return+"]");
      if(tl(l).isEmpty()) return (to_return+hd(l)+"]");
      to_return+=hd(l)+",";
      l=tl(l);
    }
  }

  String list_to_string(List l) {
    String to_return ="[";
    while(true) {
      if(l.isEmpty()) return (to_return+"]");
      if(tl(l).isEmpty()) return (to_return+hd(l)+"]");
      to_return+=hd(l)+",";
      l=tl(l);
    }
  }



}
