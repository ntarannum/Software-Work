package CO2017.exercise2.nt161;

/**
 * QueueHandler
 * 
 * Handles a file of incoming Transaction data. 
 * 
 * @author 169018358
 * @version $ID: QueueHandler.java version 8 $
 * @last_modified 15/03/18
 */

import java.io.IOException;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.Scanner;
import java.util.concurrent.*;
import java.lang.String;

/**
 * Class to read in a file of Transaction data, create suitable Transaction instances, 
 * and add them to the TransactionManager.
 */

public class QueueHandler extends java.lang.Object implements java.lang.Runnable {

	private final TransactionManager transactionmanager; // transaction manager instance that the processes will share
	private final ThreadPoolExecutor thread_executer;    // used by SimController class to manage the process threads
	private final String filename;                       // filename from which the process data can be read

	// constructor just sets the three attributes
	public QueueHandler(ThreadPoolExecutor e,
			TransactionManager tm,
			java.lang.String f){
		thread_executer = e;
		transactionmanager = tm;
		filename = f;
	}


	// behaviour of the QueueHandler when executed
	@Override
	public void run(){

		// extract the filename from the command line
		// and convert it to a filepath object
		String fname = filename; 
		Path fpath = Paths.get(fname);

		// open the file using a Scanner and read it line by line
		try (Scanner file = new Scanner(fpath)) {
			while (file.hasNextLine()) {

				// read the next line of the file into another Scanner
				Scanner line = new Scanner(file.nextLine());

				// split the line on ":"
				line.useDelimiter(":");

				// read ID (char) and runtime (int)
				char transactionid = line.next().charAt(0);
				int  runtime = line.nextInt();

				// remaining elements on the line are resources
				// put them all into a HashSet
				HashSet<Resource> resources = new HashSet<Resource> ();
				while(line.hasNext()) {
					resources.add(new Resource(line.next().charAt(0)));
				}

				// creating a transaction object and adding it to the arrival queue 
				// of the TransactionManager using the enQueue method
				// after waiting until the arrival queue is not full anymore
				Transaction transaction = new Transaction (transactionmanager, transactionid, runtime, resources);
				while(transactionmanager.isArrivalQueueFull()){}
				transactionmanager.enQueue(transaction);

				line.close();

				// printing out the ID, runtime and resources associated with a transaction
				System.out.printf("ID: %c, runtime: %s, resources: %s%n",
						transactionid, runtime, resources);

			}
			// close the file
			file.close();
		} 
		// catch exception if file is not found
		catch (NoSuchFileException e) {
			System.err.println("File not found: "+fname);
			System.exit(1);
		} 
		// catch input/output exception
		catch (IOException e) {
			System.err.println(e);
			System.exit(1);
		} 
		// catch interrupted exception
		catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
} // QueueHandler
