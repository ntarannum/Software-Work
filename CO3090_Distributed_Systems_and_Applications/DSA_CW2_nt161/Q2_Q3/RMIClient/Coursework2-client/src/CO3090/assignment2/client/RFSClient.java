package CO3090.assignment2.client;
import CO3090.assignment2.*;

import java.rmi.*;
import java.util.HashMap;


public class RFSClient {
	
    public static void main(String args[]) {
        if (System.getSecurityManager() == null) {
            System.setSecurityManager(new RMISecurityManager());
        }
        
        //////Q4.1 ////////
        //for each query class implemented in (3.1), (3.2) and (3.3), 
        //creates an instance respectively to demonstrate how it works.    
        	
        
        try {
            String name = "rmi://localhost/FileSearch";
            RFSInterface comp = (RFSInterface) Naming.lookup(name);

            QueryFileSearch fileSearch = new QueryFileSearch("hello.txt");
        	QueryMaxDepth maxDepth = new QueryMaxDepth();
        	QueryTree tree = new QueryTree();
            //Question (3) 
            /*complete this method*/
            
        	String fs = (String) comp.executeQuery(fileSearch);
        	String md = (String) comp.executeQuery(maxDepth);
        	String t = (String) comp.executeQuery(tree); 
        	
        	System.out.println(fs);
        	System.out.println(md);
            System.out.println(t);
            
        } catch (Exception e) {
            System.err.println("exception: " + 
                               e.getMessage());
            e.printStackTrace();
        }
        
       ///////Q4.2///////
       
       //use JMS for sending queries to a JMS queue. 
       //(Note: the destination queue must use /jms/queryQueue as its JNDI name).
       // Write and Deploy a simple Message-Driven Bean to process these queries in the queue. 
       //The results should be stored in /jms/resultQueue
        
        
    }
}
