import java.util.*;


public class CC06 {

  int length(List l) {
    int to_return =0;
    while(true) {
      if(l.isEmpty()) return to_return;
      l=tl(l);
      to_return++;
    }
  }

  public List less_than(List l, int n) {
    return nil(); // FIXME
  }

  public List greater_than(List l, int n) {
    return nil(); // FIXME
  }

  List quicksort(List l) {
    // check for length 0 or 1

    // get hd of l (call this n)

    // get elts less than n (call this l1)

    // get elts greater than n (call this l2)

    // call quicksort recursively to sort l1 and l2

    // join l1,n,l2 and return it
    return nil(); // FIXME
  }

  void print(String s) {
    System.out.println(s);
  } 


  void main() { 
    List l123=cons(99,cons(2,cons(3,nil())));
    List l456=cons(4,cons(100,cons(6,nil())));
    List l456123 = append(l456,l123);
    print(asString(l456123));
    print(asString(quicksort(l456123)));
  }

  public static void main(String[] args) {
    new CC06().main(); // run main functions
  }



  //////////////////////////////////////////////////////////////////////
  // ALLLIST

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

  
}
