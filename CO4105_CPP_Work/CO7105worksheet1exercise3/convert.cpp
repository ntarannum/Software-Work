// convert.cpp
// program to asks the user to input a temperature in Celsius
// and converts it to Fahrenheit
//
// Author: nt161
// Version: 1

#include <iostream>  // use the standard IO library
#include <string>    // use the standard string library

using namespace std;

int main () {
	double input;
	double answer;
	cout << "Enter a number: " << endl;
	cin >> input;
	
	answer = (input*9/5) + 32;
	
	cout << input << " Celsius is equal to " << answer << " Fahrenheit";

}
