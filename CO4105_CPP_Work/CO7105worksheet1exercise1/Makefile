# Makefile

# the C++ compiler
CXX     = g++
CC      = $(CXX)

# options to pass to the compiler
CXXFLAGS = -Wall -ansi -O2 -g

namedWelcome : namedWelcome.o
	$(CXX) $(CXXFLAGS) -o namedWelcome  namedWelcome.o

namedWelcome.o : namedWelcome.cpp
	$(CXX) $(CXXFLAGS) -c namedWelcome.cpp

.PHONY	: clean
clean	:
	$(RM) namedWelcome namedWelcome.o *~
