# Makefile

# the C++ compiler
CXX     = g++
CC      = $(CXX)

# options to pass to the compiler
CXXFLAGS = -Wall -ansi -O2 -g

pass : pass.o
	$(CXX) $(CXXFLAGS) -o pass  pass.o

pass.o : pass.cpp
	$(CXX) $(CXXFLAGS) -c pass.cpp

.PHONY	: clean
clean	:
	$(RM) pass pass.o *~
