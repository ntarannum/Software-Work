#pragma once
#include <string>
#include <sstream>
using namespace std;

class Project {

public:
	Project(const string& projectInfo);
	~Project();
	int getProjID() const;
	string getStaffID() const;
	int getMultiplicity() const;
	void reduceMultiplicity();
	string getProjTitle() const;

private:
	int project_id = -1;
	string staff_id = "";
	int multiplicity = -1;
	string proj_title = "";
};
