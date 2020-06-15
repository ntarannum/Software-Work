public class CC02 {
	String remove1(char charIn, String stringIn){
		String to_return = "";
		while(true){
			if(stringIn.equals("")){
				return to_return;
			}
			char charInString = stringIn.charAt(0);
			if(charInString==charIn){
				to_return = to_return + stringIn.substring(1);
				return to_return;
				}
			to_return = to_return + charInString;
			stringIn = stringIn.substring(1);
			}
		}
		
	
	boolean ab(String stringIn){
		while(true){
			if(stringIn.equals("")){
				return true;
			}
			char firstLetter = stringIn.charAt(0);	
			if(firstLetter == 'a'){
				return true;
			}
			if(firstLetter == 'b'){
				return false;
			}
			stringIn = stringIn.substring(1);
		}
	}
		
	
	String reverse(String stringIn){
		String to_return = "";
		while(true){
			if(stringIn.equals("")){
				return to_return;
			}
			char letter = stringIn.charAt(0);
			to_return = letter + to_return;
			stringIn = stringIn.substring(1);
		}
	}
	
	
	/*boolean startsWithShort(String s1, String s2){
		if(s2.startsWith(s1)){
			return true;
		}
		else return false;
	}*/
	
	
	boolean startswith(String str1, String str2){
		while(true){
			if(str1.equals("")){
				return true;
			}
			if(str2.equals("")){
				return false;
			}
			//char startingchar = str1.charAt(0);
			if(str1.charAt(0)!=str2.charAt(0)){
				//cannot use == operator gives the wrong result
				return false;
			}
			str1 = str1.substring(1);
			str2 = str2.substring(1);
		}
	}
	
	boolean contains(String str1, String str2){
		if(str1.equals("")){//we check outside of while loop as only
			//once we need to know if str1 is the empty string if so we
			//can automatically return true. this is because str1 even if empty is still part of str2. it doesn't have a 
			//different start
				return true;
		}
		while(true){
			if(str2.equals("")){
				return false;
			}
			if(startswith(str1,str2)){
				return true;
			}
			str2=str2.substring(1);
		}
	}
	
	
	String reverseWords(String stringIn) {
	    String to_return = "";//this will be the final word that will be returned
	    String currentWord = ""; //this keeps the current word that we are reversing
	    while(true) {
	      if(stringIn.equals("")){
	    	  return to_return + currentWord; //this will concatenate the current word (which we will be reversing) with to_return which
	    	  //is currently empty
	      } 
	      char currentLetter = stringIn.charAt(0);//just follow the reverse function
	      if(currentLetter == ' '){//checking whether the current letter is a space and so then we will concatenate the string 
	    	 to_return = to_return + currentWord + " ";
	    	 currentWord = "";
	      }
	      
	      else {
	    	  currentWord = currentLetter+currentWord;
	      }
	      stringIn = stringIn.substring(1);
	    }
	    
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		CC02 test = new CC02();
		System.out.println(test.remove1('i', "mississippi"));
		System.out.println(test.ab("abc"));
		System.out.println(test.ab("bbc"));
		System.out.println(test.ab("ans"));
		System.out.println(test.reverse("wxyz"));
		//System.out.println(test.startsWithShort("alk","alchemy"));
		System.out.println(test.startswith("alp","alchemy"));
		System.out.println(test.startswith("qwe", "qwerty"));
		System.out.println(test.contains("is","chemistry"));
		System.out.println(test.reverseWords("hello, how are you?"));
	}


}
