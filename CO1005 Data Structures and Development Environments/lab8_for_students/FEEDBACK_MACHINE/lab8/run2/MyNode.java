// in bsh, this must be loaded: addClassPath(...); import MyNode;
public class MyNode {

  public MyNode left = null;
  public Object obj = null; 
  public MyNode right = null;

  public MyNode() {}

  public MyNode(MyNode l, Object o, MyNode r) {
    left = l; obj = o; right = r;
  }

  public String toString() {
    if (left==null && right==null) return "leaf("+obj+")";
    else return "MyNode("+left+","+obj+","+right+")";
  }
  
}

