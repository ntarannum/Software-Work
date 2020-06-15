# Makefile

# the C++ compiler
CXX     = g++
CC      = $(CXX)

# options to pass to the compiler
CXXFLAGS = -Wall -ansi -O2 -g

fillArray : fillArray.o
	$(CXX) $(CXXFLAGS) -o fillArray  fillArray.o

fillArray.o : fillArray.cpp
	$(CXX) $(CXXFLAGS) -c fillArray.cpp

.PHONY	: clean
clean	:
	$(RM) fillArray fillArray.o *~
