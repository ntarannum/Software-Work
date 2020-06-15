# Makefile

# the C++ compiler
CXX     = g++
CC      = $(CXX)

# options to pass to the compiler
CXXFLAGS = -Wall -ansi -O2 -g

check : check.o
	$(CXX) $(CXXFLAGS) -o check  check.o

check.o : check.cpp
	$(CXX) $(CXXFLAGS) -c check.cpp

.PHONY	: clean
clean	:
	$(RM) check check.o *~
