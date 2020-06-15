# Makefile

# the C++ compiler
CXX     = g++
CC      = $(CXX)

# options to pass to the compiler
CXXFLAGS = -Wall -ansi -O2 -g

adding : adding.o
	$(CXX) $(CXXFLAGS) -o adding  adding.o

adding.o : adding.cpp
	$(CXX) $(CXXFLAGS) -c adding.cpp

.PHONY	: clean
clean	:
	$(RM) adding adding.o *~
