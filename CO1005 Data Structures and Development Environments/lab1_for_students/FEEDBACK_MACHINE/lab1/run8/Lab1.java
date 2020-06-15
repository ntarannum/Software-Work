public class Lab1 {

  String f () {
    return "hello world";
  }
  

  int sum(int x, int y) {
    return x+y;
  }

  boolean fizz(int x, int y) {
	int answer = y%x;
	  if(answer == 0)
	  {
		return true;
	  }
	  else return false;
  }

  int cop(int x, int y) {
	for(int i=1; i<1000; i++){
		
		if (x%i == 0 && y%i == 0){
			return i;
		}
	}
    return 0;
  }

}
