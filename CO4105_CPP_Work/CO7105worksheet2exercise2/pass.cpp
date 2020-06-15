// pass.cpp
// see website for instructions
//
// Author: nt161
// Version: 1

#include <iostream>  // use the standard IO library
#include <string>    // use the standard string library

using namespace std;

int main () {
	
	int cw_mark = 0;
	int exam_mark = 0;
	int cw_mark_cap = 0;
	float final_mark = 0;
	
	cout << "Please enter your coursework mark:" << endl;
	cin >> cw_mark;
	
	cout << "Please enter your exam mark:" << endl;
	cin >> exam_mark;
	
	if(exam_mark <= 25)
	{
		cw_mark = 50;
	}
	else
	{
		cw_mark_cap = 2*exam_mark;
		
		if(cw_mark_cap > 100)
		{
			cw_mark_cap = 100;
		}
	}
	
	if(cw_mark > cw_mark_cap)
	{
		cw_mark = cw_mark_cap;
	}

	final_mark = (0.6*exam_mark) + (0.4*cw_mark);
	
	if(final_mark<50)
	{
		cout << "Your module mark is " << final_mark << "\n" << "Unfortunately, you have not passed" << endl;
	}
	else
	{
		cout << "Your module mark is " << final_mark << "\n" << "Congratulation, you have passed" << endl;
	}
	return 0;
}


