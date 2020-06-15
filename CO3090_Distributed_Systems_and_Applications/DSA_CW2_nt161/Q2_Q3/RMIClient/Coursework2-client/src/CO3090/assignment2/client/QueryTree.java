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
		StringBuilder json = new StringBuilder();
		json.append("{\n\"list\": [{\n");
		for (String fileSystem : list.keySet()){ //getting the file system names
			StringBuilder sb = new StringBuilder();
			Vector<Integer> depth = new Vector<Integer>();
			json.append("\"fs\" : " + "\"" + fileSystem + "\", \n");
			Vector<FileItem> files = list.get(fileSystem);
			for (FileItem file: files){
				FileItem parentDir = file;
				int position = 0;
				int level = 1;
					if(parentDir.getParentDirectoryName() == null){
//						System.out.println("file name = " + parentDir.getName());
						sb.append(parentDir.getName() + "{");
						position = sb.length()-1;
//						System.out.println("last index = " + position);
//						System.out.println("parentdir null = " + sb.toString());
					}
					else
						while(parentDir.getParentDirectoryName() != null){
							//System.out.println("file is = " + parentDir.getName());
							if(!sb.toString().contains(parentDir.getName())){
								sb.append(parentDir.getName()+",");
								position = sb.length()-1;
								//System.out.println("parentdir !null = " + sb.toString());
								//System.out.println("last index = " + position);
							}
//							else if(sb.toString().contains(parentDir.getName())){
//							}
							parentDir = fileSearch(parentDir.getParentDirectoryName(), files).get(0);
							level++;
//							for(int i = 1; i<depth.size(); i++){
//								if(depth.get(i-1) < depth.get(i)){
//									
//								}
//								else if(depth.get(i-1) > depth.get(i)){
//									
//									}
//								else
//									sb.append(",");
//								i++;
//								}
//							level++;
//						if(sb.toString().contains(parentDir.getName()))
//								sb.append(parentDir.getName() + ".");
//						}
								
					//System.out.println(parentDir.toString());
				depth.add(level);
			}
			//System.out.println(depth.toString());
			//System.out.println(json.toString());
			//System.out.println(sb.toString());
			}
			json.append("\"path\" : " + sb + "\"\n},\n");
			json.append("{\n");
		}
		json.delete(json.length()-4, json.length());
		json.append("\n]\n}");
		return json.toString();
	}
}
