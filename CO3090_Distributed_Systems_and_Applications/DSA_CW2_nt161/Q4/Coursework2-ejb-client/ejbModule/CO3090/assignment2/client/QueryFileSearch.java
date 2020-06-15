package CO3090.assignment2.client;

import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;
import java.util.Map.Entry;

import CO3090.assignment2.FileItem;
import CO3090.assignment2.SearchCriteria;

//Question 3.1

/*
 * 
 *  Given a file, QueryFileSerach should return the 
 *	full paths (absolute path to your root directory) 
 *	of the given file, if it exists on one of the file 
 *	servers. If more than one file with the given name 
 *	is found then the result should include all paths. 
 *
 *	For example:
 *
 *  Given the directory structure in 
 *	RemoteFilesystem1.txt and RemoteFilesystem2.txt. 
 *  (inside filesystems folder on the RMI server)
 *	When searching for “hello.txt”, RFSServer should 
 *	return:
 *
{
	"list": [{
			"fs": "RemoteFilesystem1",
			"path": "//A/C/E/hello.txt"
		},
		{
			"fs": "RemoteFilesystem2",
			"path": "//A/B/hello.txt"
		},
		{
			"fs": "RemoteFilesystem2",
			"path": "//A/C/E/hello.txt"
		},
		{
			"fs": "RemoteFilesystem2",
			"path": "//A/C/E/F/hello.txt"
		}
	]
}

 * 
 * 
 */


public class QueryFileSearch implements SearchCriteria{


	String keyword;
	
	QueryFileSearch(String keyword){
		this.keyword=keyword;
	}
	
	public static Vector<FileItem> fileSearch(String fileName, Vector<FileItem> files){
		Vector<FileItem> list_of_files = new Vector<FileItem>();
			for(FileItem file : files){
				if(file.getName().equals(fileName)){
					list_of_files.add(file);
				}
			}
		return list_of_files;
	}
	

	@Override
	public Object execute(HashMap<String, Vector<FileItem>> list) { //string is the name of the file system
		StringBuilder json = new StringBuilder();					//list is the contents of the file system
		json.append("{\n\"list\": [{\n");
		
		for (String fileSystem : list.keySet()){ //getting the file system names
			
			Vector<FileItem> files = list.get(fileSystem);
			Vector<FileItem> foundFiles = fileSearch(keyword,files);
			for(FileItem file : foundFiles){
				json.append("\"fs\" : " + "\"" + fileSystem + "\", \n");
				FileItem parentDir = file;
				String pathname = file.getName();
				while(parentDir.getParentDirectoryName() != null){
					String parentDirName = parentDir.getParentDirectoryName();
					parentDir = fileSearch(parentDirName, files).get(0);
					//System.out.println("parent directory: "+parentDir);
					pathname = (parentDirName != null)?(parentDirName+ "/" + pathname):("");
				}
				pathname = "\"//" + pathname;
				json.append("\"path\" : " + pathname + "\"\n},\n");
				json.append("{\n");
			}
			
		}
		json.delete(json.length()-4, json.length());
		json.append("\n]\n}");
		
		System.out.println(json.toString());
		
		return json.toString();
	}

	

}
