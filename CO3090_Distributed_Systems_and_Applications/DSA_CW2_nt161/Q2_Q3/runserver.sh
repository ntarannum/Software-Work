#/bin/sh
#write a shell script to start the RMI server
#Question (4.4)
java -cp ./bin/ -Djava.rmi.server.codebase=https://campus.cs.le.ac.uk/people/nt161/Coursework2-server.jar -Djava.rmi.server.useCodebaseOnly=false -Djava.security.policy=https://campus.cs.le.ac.uk/people/nt161/policy.permission CO3090.assignment2.server.RFSServer
