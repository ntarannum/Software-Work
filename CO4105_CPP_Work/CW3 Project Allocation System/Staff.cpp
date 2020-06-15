#include "Staff.h"

Staff::Staff(const string& staffInfo)
{
	istringstream staffStream(staffInfo);
	staffStream >> staff_id;
	staffStream >> load;
}

Staff::~Staff() {
}

string Staff::getStaffID() const{
	return staff_id;
}

int Staff::getLoad() const {
	return load;
}

void Staff::reduceLoad() {
	load--;
}