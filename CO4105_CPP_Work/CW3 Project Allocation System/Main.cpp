#include "Student.h"
#include "Staff.h"
#include "Project.h"
#include <stdio.h>
#include <string.h> 
#include <iostream>
#include <fstream>
#include <map>
#include <memory>

using namespace std;

int score = 0;
map<string, int> supervisors;
map<int, shared_ptr<Project>> projects;
map<string, int> student_allocation;

void findOptimalChoice(shared_ptr<Student> stu) {
	int current_choice = stu->getFirstChoice();
	shared_ptr<Project> p = projects[stu->getFirstChoice()];
	for (int i = 4; i > 0; i--) {
		if (p->getMultiplicity() == 0 || supervisors[p->getStaffID()] == 0) {
			switch (i) {
			case 4:
				current_choice = stu->getSecondChoice();
				p = projects[current_choice];
				break;
			case 3:
				current_choice = stu->getThirdChoice();
				p = projects[current_choice];
				break;
			case 2:
				current_choice = stu->getFourthChoice();
				p = projects[current_choice];
				break;
			case 1:
				student_allocation.insert(pair<string, int>(stu->getStudID(), 0));
			}
		}
		else {
			p->reduceMultiplicity();
			supervisors[p->getStaffID()]--;
			student_allocation.insert(pair<string, int>(stu->getStudID(), current_choice));
			score += i;
			break;
		}
	}
}

void writeFile(map<string, int> allocation, int tot_score) {

	ofstream out("alloc.txt");
	for (const auto& x : allocation) {
		out << x.first << " " << x.second << "\n";
	}	
	out << tot_score;
}



int main(int argc, const char* argv[]) {

	if (argc != 4) 
	{
		cout << "You need to supply 3 arguments to run this program." << endl;
		return 0;
	}
	
	if ((strcmp(argv[1], "staff.txt") != 0) || (strcmp(argv[2], "projects.txt") != 0) || (strcmp(argv[3], "students.txt") != 0))
	{
		cout << "Please run the program like so: ./main staff.txt projects.txt students.txt" << endl;
		return 0;
	}


	ifstream staff_file(argv[1]);
	string staffContents = "";
	
	while (!staff_file.eof())
	{
		getline(staff_file, staffContents);

		if (staffContents.empty())
		{
			break;
		}
		Staff sta(staffContents);
		supervisors.insert(pair<string, int>(sta.getStaffID(), sta.getLoad()));
	}
	staff_file.close();

	ifstream project_file(argv[2]);
	string projectContents = "";

	while (!project_file.eof())
	{
		getline(project_file, projectContents);

		if (projectContents.empty())
		{
			break;
		}

		shared_ptr<Project> pro = make_shared<Project>(projectContents);
		projects.insert(pair<int, shared_ptr<Project>>(pro->getProjID(), pro));
	}
	project_file.close();

	ifstream student_file(argv[3]);
	string studentContents = "";
	
	while (!student_file.eof())
	{
		getline(student_file, studentContents);
		if (studentContents.empty())
		{
			break;
		}
		shared_ptr<Student> stu = make_shared<Student>(studentContents);
		findOptimalChoice(stu);
	}
	student_file.close();

	writeFile(student_allocation, score);
	cout << "Program has completed \nPlease check the directory (where the program is stored) for the produced file alloc.txt" << endl;
}