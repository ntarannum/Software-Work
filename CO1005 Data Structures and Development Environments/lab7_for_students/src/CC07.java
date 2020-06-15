import java.util.*;


public class CC07 {
  
  List inter(List l1, List l2) {
	Set s1 = new HashSet(l1);
	  List to_return = nil();
	  while(true){
		if(l2.isEmpty() || l1.isEmpty()) return to_return;
			if(s1.contains(hd(l2))){
			to_return = append1(to_return, hd(l2));
		}
	l2 = tl(l2);	
	}
  }

  char first_non_repeated(String s) {
	  if(s.isEmpty()) 
			return 'a';
	  HashMap m1 = new HashMap();
	  String s1 = s;
	  
	  while(!s1.isEmpty() ){
		  char c = s1.charAt(0);
		  
		  if(m1.containsKey(c)){
			  m1.put(c,(int)m1.get(c)+1);
			  }
			  
			  else{
				  m1.put(c,1);
				  }
		  
		  /*Integer count = (Integer)(m1.get(c));
		  if(count==null){
			 m1.put(c,1);
			  }
			  else {
				m1.put(c, count+1);
			  }*/
				  
		s1 = s1.substring(1);
	}
	
	while(true){
		if(s.isEmpty()) 
			return 'a';
		char c2 = s.charAt(0);
		if((int) m1.get(c2) == 1){
			return c2;
		}
		s = s.substring(1);
	}
	
}


  boolean well_bracket(String s) {

  Stack mystack = new Stack();
    
	  while(true) {
	    
		if(s.equals("")) {
			if(!mystack.isEmpty()){ 
				return false;
			}
			else return true;
		}
		char c = s.charAt(0);
		if((c == '(') || (c == '[')) {
			mystack.push(c);
		}

		if((c == ')') || (c == ']')) {
			if(mystack.isEmpty()) {
				return false;
			}
			char c2 = (Character)(mystack.pop());
			if((c == ')') && (c2 != '(')){ 
				return false;
			}
			if((c == ']') && (c2 != '[')){ 
				return false;
			}
		      }
			
		s=s.substring(1);
  }


}






  // List functions ----------------------------------------

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
