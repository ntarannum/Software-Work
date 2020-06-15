# Makefile

# the C++ compiler
CXX     = g++
CC      = $(CXX)

# options to pass to the compiler
CXXFLAGS = -Wall -ansi -O2 -g

convert : convert.o
	$(CXX) $(CXXFLAGS) -o convert  convert.o

convert.o : convert.cpp
	$(CXX) $(CXXFLAGS) -c convert.cpp

.PHONY	: clean
clean	:
	$(RM) convert convert.o *~
