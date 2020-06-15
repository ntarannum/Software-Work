// namedWelcome.cpp
// program to asks the user to input her name and print out
// Hello <name>!
// Welcome to CO7105
//
// Author: nt161
// Version: 1

#include <iostream>  // use the standard IO library
#include <string>    // use the standard string library

using namespace std;

int main () {
	string name;
	cout << "Enter name: " << endl;
	cin >> name;
	cout << "Hello " << name << "\n" << "Welcome to CO7105" << endl;
	
	
	return 0;
}
