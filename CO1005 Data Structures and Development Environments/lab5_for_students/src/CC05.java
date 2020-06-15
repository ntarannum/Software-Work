/*

  Version of isort using typed interfaces

*/

import java.util.*;

// generic typed insertion sort ----------------------------------------

public class CC05 {

  // compare two elements ----------------------------------------
  static interface Comp<E> {
    public boolean c_lt(E e1, E e2); // c_ stands for "comp"
  }

  // "list-like" operations ----------------------------------------

  // string/list operations; E is element type; L is list type; g_
  // stands for "generic"
  static interface Ops<E,L> {
    L g_nil();
    L g_cons(E x, L l);
    L g_append(L l1, L l2);
    L g_append1(L l, E e);

    boolean g_is_empty(L l);
    E g_hd(L l);
    L g_tl(L l);    
  }


  // insertion sort ----------------------------------------

  static class Sorter<E,L> {
    
    Comp<E> comp;
    Ops<E,L> ops;

    public Sorter(Comp<E> c, Ops<E,L> o) {
      this.comp = c;
      this.ops = o;
    }

    L insert(E o, L l) {
      L to_return = ops.g_nil();
      while(true) {
        if(ops.g_is_empty(l)) return ops.g_append1(to_return,o);
        E o2 = ops.g_hd(l);
        if(comp.c_lt(o2,o)) 
          to_return = ops.g_append1(to_return,o2);
        else 
          return ops.g_append(ops.g_append1(to_return,o),l);
        l = ops.g_tl(l);
      }
    }
  
    L isort(L l) {
      L to_return = ops.g_nil();
      while(true) {
        if(ops.g_is_empty(l)) return to_return;
        E o = ops.g_hd(l);
        to_return = insert(o,to_return);
        l = ops.g_tl(l);
      }
    }

  } // Sorter



  // example executions ----------------------------------------

  // the same isort code works for int lists and strings!
  public void main() {

    // // sort list of integers ----------------------------------------    
    // { 
    //   Sorter<Integer,List<Integer>> x = 
    //     new Sorter(
    //                new I_comp(),
    //                new I_list_ops()
    //                );
    //   List<Integer> l = java.util.Arrays.asList(new Integer[] {4,1,2,0});
    //   // System.out.println(x.isort(l));
    // }
    // 
    // // sort a string ----------------------------------------
    // {
    //   Sorter<Character,String> x = 
    //     new Sorter(
    //                new C_comp(),
    //                new String_ops()
    //                );
    //   // System.out.println(x.isort("defabcg"));
    // }


    // sort a list of people by first name
    List<Person> ps = java.util.Arrays.asList(new Person[] {
        new Person("Bert","Dent"),
        new Person("Alf","Figgis"),
        new Person("Charlie","Carruthers"),
        new Person("Ellie","Bloggs"),
        new Person("Davina","Ewans")
      });
    {
      Sorter<Person,List<Person>> x = 
        new Sorter(
                   new Comp_by_first_name(),
                   new P_list_ops()
                   );
      System.out.println(x.isort(ps)); 
    }

    // sort a list of people by last name
    // FIXME add some code here
      {  Sorter<Person,List<Person>> y = 
        new Sorter(
                   new Comp_by_last_name(),
                   new P_list_ops()
                   );
      System.out.println(y.isort(ps)); 
  }
}

  // static main ----------------------------------------

  public static void main(String[] args) {
    new CC05().main();
  }



  // example ops (person list) ----------------------------------------

  static class Person {
    String first, last;
    Person(String f, String l) { first=f; last=l; }
    public String toString() { return "-"+first+" "+last+"-"; }
  }

  // returns true if s1 < s2
  static boolean lexcompare(String s1, String s2) {
    return s1.compareTo(s2) < 0;
  }

  // compare by first name
  static class Comp_by_first_name implements Comp<Person> {
    public boolean c_lt(Person e1, Person e2) {
      //return true; // FIXME replace this; use lexcompare from just above
	    return lexcompare(e1.first,e2.first);
    }
  }

  // compare by last name
  static class Comp_by_last_name implements Comp<Person> {
    public boolean c_lt(Person e1, Person e2) {
      //return true; // FIXME replace this; use lexcompare from just above
	    return lexcompare(e1.last,e2.last);
    }
  }


  static class P_list_ops implements Ops<Person,List<Person>> {

    public boolean g_is_empty(List<Person> l) { return l.isEmpty(); }
    
    public Person g_hd(List<Person> l) { return (Person)(hd(l)); }

    public List<Person> g_tl(List<Person> l) { return (List<Person>)tl(l); }

    public List<Person> g_append(List<Person> l1,List<Person> l2) {
      return (List<Person>)append(l1,l2);
    }

    public List<Person> g_append1(List<Person> l1, Person e) {
      return (List<Person>)append1(l1,e);
    }

    public List<Person> g_nil() { return (List<Person>)nil(); }

    public List<Person> g_cons(Person x, List<Person> l) {
      return (List<Person>)cons(x,l);
    }
   

    //////////////////////////////////////////////////////////////////////
    // cons, nil etc are implemented below this line;
    // you can probably ignore what is below
  
    // most of the following methods could/should be static

    // clone is protected, so we could subclass but...  

    // YOU ARE NOT ALLOWED TO USE THIS COPY FUNCTION!!! IT IS ONLY FOR
    // IMPLEMENTING cons ETC.
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





  // example ops (string) ----------------------------------------

  static class String_ops implements Ops<Character,String> {

    public boolean g_is_empty(String l) { return l.equals(""); }

    public Character g_hd(String l) { return l.charAt(0); }

    public String g_tl(String l) { return l.substring(1);  }

    public String g_append(String l1,String l2) { return l1+l2; }

    public String g_append1(String l1, Character e) { return l1+e; }

    public boolean g_lt(Character o1,Character o2) { return o1 < o2; }

    public String g_nil() { return ""; }

    public String g_cons(Character x, String l) { return x.toString()+l; }    

  }

  // char compare
  static class C_comp implements Comp<Character> {
    public boolean c_lt(Character e1, Character e2) {
      return e1 < e2;
    }
  }
  

  // example ops (int list) ----------------------------------------

  // int compare
  static class I_comp implements Comp<Integer> {
    public boolean c_lt(Integer e1, Integer e2) {
      return e1 < e2;
    }
  }

  static class I_list_ops implements Ops<Integer,List<Integer>> {

    public boolean g_is_empty(List<Integer> l) { return l.isEmpty(); }
    
    public Integer g_hd(List<Integer> l) { return (Integer)(hd(l)); }

    public List<Integer> g_tl(List<Integer> l) { return (List<Integer>)tl(l); }

    public List<Integer> g_append(List<Integer> l1,List<Integer> l2) {
      return (List<Integer>)append(l1,l2);
    }

    public List<Integer> g_append1(List<Integer> l1, Integer e) {
      return (List<Integer>)append1(l1,e);
    }

    public List<Integer> g_nil() { return (List<Integer>)nil(); }

    public List<Integer> g_cons(Integer x, List<Integer> l) {
      return (List<Integer>)cons(x,l);
    }
   

    //////////////////////////////////////////////////////////////////////
    // cons, nil etc are implemented below this line;
    // you can probably ignore what is below
  
    // most of the following methods could/should be static

    // clone is protected, so we could subclass but...  

    // YOU ARE NOT ALLOWED TO USE THIS COPY FUNCTION!!! IT IS ONLY FOR
    // IMPLEMENTING cons ETC.
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



}

