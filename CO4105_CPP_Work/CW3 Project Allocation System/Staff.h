#pragma once
#include <string>
#include <sstream>
using namespace std;


class Staff{

public:
	Staff(const string& staffInfo);
	~Staff();
	string getStaffID() const;
	int getLoad() const;
	void reduceLoad();

private:
	string staff_id = "";
	int load = -1;
};