package CO3090.assignment2.client;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;

import CO3090.assignment2.FileItem;
import CO3090.assignment2.SearchCriteria;

//Question 3.2

/*
 * 
 * QueryMaxDepth should return the maximum 
 * directory depth on all file servers. 
 * 
 * For example, given the directory structure in 
 * RemoteFilesystem1.txt and RemoteFilesystem2.txt. 
 * RFSServer should return:
 * 
{
	"list": [{
			"fs": "RemoteFilesystem2",
			"depth": "5"
		},
		{
			"fs": "RemoteFilesystem1",
			"depth": "4"
		}
	]
}													

 * 
 */

public class QueryMaxDepth implements SearchCriteria{
	
	public static Vector<FileItem> fileSearch(String dir, Vector<FileItem> files){
		Vector<FileItem> list_of_files = new Vector<FileItem>();
			for(FileItem file : files){
				if(file.getName().equals(dir)){
					list_of_files.add(file);
				}
			}
		return list_of_files;
	}
	
	
	@Override
	public Object execute(HashMap<String, Vector<FileItem>> list) {
		
		StringBuilder json = new StringBuilder();
		Vector<Integer> depth = new Vector<Integer>();
		json.append("{\n\"list\": [{\n");
		for (String fileSystem : list.keySet()){ //getting the file system names
			json.append("\"fs\" : " + "\"" + fileSystem + "\", \n");
			Vector<FileItem> files = list.get(fileSystem);
			for(FileItem file : files){
				FileItem parentDir = file;
				int i = 1;
				while(parentDir.getParentDirectoryName() != null){
					parentDir = fileSearch(parentDir.getParentDirectoryName(), files).get(0);
					i = i+1;
				}
				depth.add(i);
			}
		int maxDepth = Collections.max(depth).intValue();
		depth.clear();
		json.append("\"depth\" : \"" + maxDepth + "\"\n},\n");
		json.append("{\n");
		
		}
		
		json.delete(json.length()-4, json.length());
		json.append("\n]\n}");
		
		System.out.println(json.toString());
		
		return json.toString();
	}

}
