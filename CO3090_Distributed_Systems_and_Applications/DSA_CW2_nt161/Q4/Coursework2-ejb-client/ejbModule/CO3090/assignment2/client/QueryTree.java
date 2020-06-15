package CO3090.assignment2.client;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Vector;

import CO3090.assignment2.FileItem;
import CO3090.assignment2.SearchCriteria;

//Question 3.3

/*
*   For each file server, QueryTree should return the directory 
*   structure as a string formatted according to the specified 
*   format. 
*   
*   For example, given the directory structure in 
*   RemoteFilesystem1.txt and RemoteFilesystem2.txt. 
*   RFSServer should return:
*
{
	"list": [{
			"fs": "RemoteFilesystem1",
			"path": "A{B,C{books.xls,D,E{readme.txt,hello.txt},F{G}}}"
		},
		{
			"fs": "RemoteFilesystem2",
			"path": "A{B{hello.txt,D{abc.txt,xyz.txt}},C{E{hello.txt,F{hello.txt}}}}"
		}
	]
}

*
 */

public class QueryTree implements SearchCriteria{
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
		HashMap<Integer, Vector<FileItem>> tree = new HashMap<Integer, Vector<FileItem>>();
		StringBuilder json = new StringBuilder();
		StringBuilder sb = new StringBuilder();
		json.append("{\n\"list\": [{\n");
		
		for (String fileSystem : list.keySet()){ //getting the file system names
			json.append("\"fs\" : " + "\"" + fileSystem + "\", \n");
			Vector<FileItem> files = list.get(fileSystem);
			for (FileItem file: files){
				FileItem parentDir = file;
				Integer i = new Integer(1);
				while(parentDir.getParentDirectoryName() != null){
					parentDir = fileSearch(file.getParentDirectoryName(), files).get(0);
					i = i+1;
				}
				Vector<FileItem> temp_list = (tree.containsKey(i))?(tree.get(i)):(new Vector<FileItem>());
				temp_list.add(file);
				tree.put(i, temp_list);
			}
			
			for(int i : tree.keySet()){
				if(i>1){
					for(FileItem file: tree.get(i)){
						String fname = file.getName();
						int index;
						if((index = sb.indexOf(fname+"{")) != -1){
							sb.append(file.getParentDirectoryName() + "{" + fname + "}");
						} else {
							int last_index =  sb.indexOf("{", index);
							sb.replace(index,last_index, sb.substring(index, last_index) + "," + fname);
						}
					}
				}
			}
		}
		return json.append(sb).toString();
	}
}
