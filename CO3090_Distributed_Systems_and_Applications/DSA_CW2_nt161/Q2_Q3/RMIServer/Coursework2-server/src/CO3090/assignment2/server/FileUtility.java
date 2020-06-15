package CO3090.assignment2.server;


import java.awt.List;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Vector;

import CO3090.assignment2.FileItem;
import CO3090.assignment2.FileItemType;

public class FileUtility {

	final static String fileSystemPath="./filesystems/";
	
	public static Vector<FileItem> fileSearch(String fileName, Vector<FileItem> files){
		Vector<FileItem> list_of_files = new Vector<FileItem>();
			for(FileItem file : files){
				if(file.getName().equals(fileName)){
					list_of_files.add(file);
				}
			}
		return list_of_files;
	}
	
	public static void main(String[] args){
		
		Vector<String> fsIndex=readDistributedFilesystemList();
		
//		for(String filesystem: fsIndex){		
//			for(FileItem f: readFS(fileSystemPath+filesystem)){
//				System.out.println(fsIndex+" ->" +f);
//			}
//		}
		/*FILE SEARCH*/
//		StringBuilder json = new StringBuilder();					//list is the contents of the file system
//		json.append("{\n\"list\": [{\n");
//		
//		for (String fileSystem : fsIndex){ //getting the file system names
//			
//			Vector<FileItem> files = readFS(fileSystemPath+fileSystem);
//			Vector<FileItem> foundFiles = fileSearch("hello.txt",files);
//			for(FileItem file : foundFiles){
//				json.append("\"fs\" : " + "\"" + fileSystem + "\", \n");
//				FileItem parentDir = file;
//				String pathname = file.getName();
//				while(parentDir.getParentDirectoryName() != null){
//					String parentDirName = parentDir.getParentDirectoryName();
//					parentDir = fileSearch(parentDirName, files).get(0);
//					System.out.println("parent directory: "+parentDir);
//					pathname = (parentDirName != null)?(parentDirName+ "/" + pathname):("");
//				}
//				pathname = "\"//" + pathname;
//				json.append("\"path\" : " + pathname + "\"\n},\n");
//				json.append("{\n");
//			}
//			
//		}
//		json.delete(json.length()-4, json.length());
//		json.append("\n]\n}");
//		
//		System.out.println(json.toString());
		
		/*MAX DEPTH SEARCH*/
//		StringBuilder json = new StringBuilder();
//		Vector<Integer> depth = new Vector<Integer>();
//		json.append("{\n\"list\": [{\n");
//		for (String fileSystem : fsIndex){ //getting the file system names
//			json.append("\"fs\" : " + "\"" + fileSystem + "\", \n");
//			Vector<FileItem> files = readFS(fileSystemPath+fileSystem);
//			for(FileItem file : files){
//				FileItem parentDir = file;
//				int i = 1;
//				while(parentDir.getParentDirectoryName() != null){
//					parentDir = fileSearch(parentDir.getParentDirectoryName(), files).get(0);
//					i = i+1;
//				}
//				depth.add(i);
//			}
//		int maxDepth = Collections.max(depth).intValue();
//		json.append("\"depth\" : \"" + maxDepth + "\"\n},\n");
//		json.append("{\n");
//		}
//		
//		json.delete(json.length()-4, json.length());
//		json.append("\n]\n}");
//		//System.out.println(depth.toString());
//		System.out.println(json.toString());
//	}
		/*TREE SEARCH*/
		
//		HashMap<Integer, String> tree = new HashMap<Integer, String>();
//		StringBuilder json = new StringBuilder();
//
//		for (String fileSystem : fsIndex){ //getting the file system names
//			StringBuilder sb = new StringBuilder();
//			Vector<Integer> depth = new Vector<Integer>();
//			json.append("\"fs\" : " + "\"" + fileSystem + "\", \n");
//			Vector<FileItem> files = readFS(fileSystemPath+fileSystem);
//			for (FileItem file: files){
//				FileItem parentDir = file;
//				int position = 0;
//				int level = 1;
//					if(parentDir.getParentDirectoryName() == null){
//						System.out.println("file name = " + parentDir.getName());
//						sb.append(parentDir.getName() + "{");
//						position = sb.length()-1;
//						System.out.println("last index = " + position);
//						System.out.println("parentdir null = " + sb.toString());
//					}
//					else
//						while(parentDir.getParentDirectoryName() != null){
//							System.out.println("file is = " + parentDir.getName());
//							if(!sb.toString().contains(parentDir.getName())){
//								sb.append(parentDir.getName());
//								position = sb.length()-1;
//								System.out.println("parentdir !null = " + sb.toString());
//								System.out.println("last index = " + position);
//							}
////							else if(sb.toString().contains(parentDir.getName())){
////							}
//							parentDir = fileSearch(parentDir.getParentDirectoryName(), files).get(0);
//							//level++;
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
////						if(sb.toString().contains(parentDir.getName()))
////								sb.append(parentDir.getName() + ".");
////						}
//								
//					//System.out.println(parentDir.toString());
//				depth.add(level);
//			}
//			System.out.println(depth.toString());
//			//System.out.println(json.toString());
//			System.out.println(sb.toString());
//			}
//		}
	}
	
    /**
     * @return  return a list of files located in ./filesystems/.
     */
	public static Vector<String> readDistributedFilesystemList(){
		File[] files = new File(fileSystemPath).listFiles();
		Vector<String> list=new Vector<String>();
		for (File fsIndexFile : files) {
		    if (fsIndexFile.isFile()) {
		    	list.add(fsIndexFile.getName());
		    }
		}
		
		return list;
		
	}
	
	
    /**
     * @param txt file storing directory information
     * @return  return FileItem objects from the file provided.
     */

    public static Vector<FileItem> readFS(String filename){
    	
    	
    	 Vector<FileItem> map =new Vector<FileItem>();
    	
    	 try{ 
	    	    FileInputStream fstream = new FileInputStream(filename);
	    	    DataInputStream in = new DataInputStream(fstream);
	    	    BufferedReader br = new BufferedReader(new InputStreamReader(in));
	    	    String strLine;
	    	    
	    	    while ((strLine = br.readLine()) != null)   {
	    	    	
	    	    	if(!strLine.trim().startsWith("#") && !strLine.trim().equals("")){
		    	    	String[] array=strLine.split(",");
		    	    	
		    	    	String fitype=array[0];
		    	    	String name=array[1];
		    	    	String parent=array[2];
		    	    	FileItemType type=FileItemType.UNKNOWN;
		    	    	
		    	    	if(fitype!=null){
		    	    		if(fitype.equals("FILE")){
		    	    			type=FileItemType.FILE;
		    	    		}else if(fitype.equals("DIR")){
		    	    		   type=FileItemType.DIR;
		    	    		}else{
		    	    			type=FileItemType.UNKNOWN;
		    	    		}
		    	    	}
		    	    	
		    	    	if(parent.equals("?")){
		    	    		parent=null;
		    	    	}
		    	    	
		    	    	FileItem f= new FileItem(name,type,parent);
		    	    		
		    	    	map.add(f);
	    	    	}
	    	    	
	    	    }
  	
	    	    in.close();    	    
				    	    
			  }catch(Exception ex){
			  	ex.printStackTrace();
			  }
			  
	    return map;
  
  }
	
  

}




