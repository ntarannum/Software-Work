// check.cpp
// program to asks the user to input a number between 0 and 100
// In the case the number is too low it outputs "Your number is below 0"
// In the case the number is too high it outputs "Your number is above 100"
// Otherwise it outputs "<number> is in range"
//
// Author: nt161
// Version: 1

#include <iostream>  // use the standard IO library
#include <string>    // use the standard string library

using namespace std;

int main () {

	int input;
	
	cout << "Enter a number: " << endl;
	cin >> input;
	
	if (input < 0)
	{
		cout << "Your number is below 0" << endl;
	}
	else if (input > 100)
	{
		cout << "Your number is above 100" << endl;	
	}
	else
		cout << input << " is in range" << endl;
	
	
	return 0;

}
