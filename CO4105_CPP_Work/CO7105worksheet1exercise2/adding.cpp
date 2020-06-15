// adding.cpp
// program to asks the user to input two numbers 
// and prints the sum of them 
//
// Author: nt161
// Version: 1

#include <iostream>  // use the standard IO library
#include <string>    // use the standard string library

using namespace std;

int main () {
	int x,y;
	cin >> x;
	cin >> y;
	int answer = x+ y;
	cout << x << " plus " << y << " is "<< answer << endl;
	return 0;
}
