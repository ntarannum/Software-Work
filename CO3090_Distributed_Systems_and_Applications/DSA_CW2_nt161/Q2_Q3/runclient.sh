#write a shell script to start the client
#Question (4.4)
java -cp ./bin/ -Djava.rmi.server.codebase=https://campus.cs.le.ac.uk/people/nt161/Coursework2-client.jar -Djava.rmi.server.useCodebaseOnly=false -Djava.security.policy=https://campus.cs.le.ac.uk/people/nt161/policy.permission CO3090.assignment2.client.RFSClient 127.0.0.1/FileSearch
