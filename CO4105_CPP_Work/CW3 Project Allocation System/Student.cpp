#include "Student.h"

Student::Student(const string& studentInfo) 
{
	istringstream studentStream(studentInfo);
	studentStream >> stud_id;
	studentStream >> first;
	studentStream >> second;
	studentStream >> third;
	studentStream >> fourth;
}

Student::~Student() {
}

string Student::getStudID() const {
	return stud_id;
}

int Student::getFirstChoice() const {
	return first;
}

int Student::getSecondChoice() const {
	return second;
}

int Student::getThirdChoice() const {
	return third;
}

int  Student::getFourthChoice() const {
	return fourth;
}
