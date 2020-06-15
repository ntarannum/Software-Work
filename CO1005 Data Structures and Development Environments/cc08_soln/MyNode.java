// in bsh, this must be loaded: addClassPath(...);
public class MyNode {

  public MyNode left = null;
  public Object obj = null; 
  public MyNode right = null;

  public MyNode() {}

  public MyNode(MyNode l, Object o, MyNode r) {
    left = l; obj = o; right = r;
  }

  public String toString() {
    return "MyNode("+left+","+obj+","+right+")";
  }
  
}

