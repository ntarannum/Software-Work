# Makefile

# the C++ compiler
CXX     = g++
CXXVERSION = $(shell g++ --version | grep ^g++ | sed 's/^.* //g')

# options to pass to the compiler
CXXFLAGS = -O0 -g3

ifeq "$(CXXVERSION)" "4.6.3"
	CXXFLAGS += -std=c++0x
else
	CXXFLAGS += -std=c++11
endif

All: all
all: main

main: Main.cpp Project.o Staff.o Student.o
	$(CXX) $(CXXFLAGS) Main.cpp Project.o Staff.o Student.o -o main

Project.o: Project.cpp Project.h
	$(CXX) $(CXXFLAGS) -c Project.cpp -o Project.o

Staff.o: Staff.cpp Staff.h	
	$(CXX) $(CXXFLAGS) -c Staff.cpp -o Staff.o

Student.o: Student.cpp Student.h
	$(CXX) $(CXXFLAGS) -c Student.cpp -o Student.o

deepclean: 
	rm -f *~ *.o main *.exe *.stackdump main

clean:
	-rm -f *~ *.o *.stackdump

