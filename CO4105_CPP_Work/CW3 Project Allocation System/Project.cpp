#include "Project.h"

Project::Project(const string& projectInfo)
{
	istringstream projectStream(projectInfo);
	projectStream >> project_id;
	projectStream >> staff_id;
	projectStream >> multiplicity;
	getline(projectStream, proj_title);
}

Project::~Project() {
}

int Project::getProjID() const {
	return project_id;
}

string Project::getStaffID() const {
	return staff_id;
}

int Project::getMultiplicity() const {
	return multiplicity;
}

void Project::reduceMultiplicity() {
	multiplicity--;
}

string Project::getProjTitle() const {
	return proj_title;
}
