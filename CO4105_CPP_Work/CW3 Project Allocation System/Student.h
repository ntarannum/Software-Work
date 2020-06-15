#pragma once
#include <string>
#include <sstream>
using namespace std;

class Student {

public:

	Student(const string& studentInfo);
	~Student();
	string getStudID() const;
	int getFirstChoice() const;
	int getSecondChoice() const;
	int getThirdChoice() const;
	int getFourthChoice() const;

private:
	string stud_id = "";
	int first = -1;
	int second = -1;
	int third = -1;
	int fourth = -1;
};