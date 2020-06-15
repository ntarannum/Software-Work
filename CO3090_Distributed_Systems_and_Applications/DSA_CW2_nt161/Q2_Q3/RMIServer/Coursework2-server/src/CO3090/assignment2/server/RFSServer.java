package CO3090.assignment2.server;

import CO3090.assignment2.*;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.rmi.*;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.*;
import java.util.HashMap;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

//Question (2.3)
public class RFSServer extends UnicastRemoteObject implements RFSInterface
{	
    public RFSServer() throws RemoteException {
       super();
    }

    public static void main(String[] args) {
    	
    	if (System.getSecurityManager() == null) {
    	    System.setSecurityManager(new RMISecurityManager());
    	}
    	String name = "rmi://localhost/FileSearch";
    	try {
    	    RFSInterface engine = new RFSServer();
    	    
    	    /*complete this method*/
    	    //Registry registry = LocateRegistry.getRegistry(name);
    	    //LocateRegistry.createRegistry(insert portnumber)
    	    Naming.rebind(name, engine);
    	    System.out.println("FileSearch Service bound");  
    	} catch (Exception e) {
    	    System.err.println("FolderSearch exception: " + 
    			       e.getMessage());
    	    e.printStackTrace();
    	}
    	
    	
    }


    //Question (2.3)
	@Override
	public Object executeQuery(SearchCriteria searchCriteria) throws RemoteException {
		HashMap<String, Vector<FileItem>> map = new HashMap<String, Vector<FileItem>>();
		Vector<String> remote_filesystems = FileUtility.readDistributedFilesystemList();
		for (String filesystem: remote_filesystems)
		{
			map.put(filesystem.substring(0, filesystem.lastIndexOf('.')), FileUtility.readFS(FileUtility.fileSystemPath + filesystem));
		}
		
		return searchCriteria.execute(map);
	}

    
}
