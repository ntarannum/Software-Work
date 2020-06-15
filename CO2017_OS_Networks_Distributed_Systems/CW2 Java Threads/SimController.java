package CO2017.exercise2.nt161;

/**
 * SimController
 * 
 * Controls the execution of the threads.
 * 
 * @author 169018358
 * @version $ID: SimController.java version 8 $
 * @last_modified 15/03/18
 */

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.HashMap;

/**
 * Controller Class for the simulation. 
 */

public class SimController extends java.lang.Object implements java.lang.Runnable {

	private TransactionManager transactionManager; // transaction manager instance
	private ThreadPoolExecutor executor;           // a threadpool executor instance

	// constructor that set the two attributes
	public SimController (TransactionManager transacManager, ThreadPoolExecutor exec)
	{
		transactionManager = transacManager;
		executor = exec;
	}

	// behaviour of the SimController when executed
	@Override
	public void run(){
		// while the thread pool executor is not shut down
		// i.e. the thread pool is still running
		while(!executor.isShutdown())
		{
			// if the transactionManager instance is not 
			if(transactionManager.isChanged()){
				// prints the transaction manager instance
				// i.e. the arrival queue, active queue and the blocked queue
				System.out.println(transactionManager.toString());
			}
			try {
				// this is done once a second
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

	} 

	public static void main(java.lang.String[] args) 
	{

		final int totalTM_queue_size = Integer.valueOf(args[0]); // attribute which stores the queue size
		final int interval_time = Integer.valueOf(args[1]);      // attribute which stores the interval
		final String filename = args[2];                         // attribute which stores the file name of the transaction input file
		HashMap<Character, Resource> resourcesAvailable = new HashMap<Character, Resource>(); // map which stores all available resources 

		// adds resources from the command line arguments to the available resources HashMap
		// named resourcesAvailable
		// if the none of the arguments are null
		for (int i = 3; i< args.length; i++){
			if(args[i] != null){
				resourcesAvailable.put(args[i].charAt(0), new Resource(args[i].charAt(0))); 
			}
		}

		// creates a new ThreadPoolExecutor
		ThreadPoolExecutor ex = (ThreadPoolExecutor) Executors.newCachedThreadPool();
		
		// creates and starts a thread for the TransactionManager 
		// so it will start checking for new Transaction arrivals 
		TransactionManager transaction_manager = new TransactionManager(ex, totalTM_queue_size, resourcesAvailable, interval_time);
		Thread tm_thread = new Thread(transaction_manager);
		tm_thread.start();

		// creates a new watcher thread passing through the simcontroller object
		// and starts the watcher thread
		SimController sim_controller = new SimController(transaction_manager, ex);		
		Thread watcherThread = new Thread(sim_controller);
		watcherThread.start();

		// creates a thread for the QueueHandler and starts it 
		// so that it processes the input file, 
		// creating a Transaction instance for each line and giving the instance to the 
		// TransactionManager as a new arrival 
		QueueHandler queue_handler = new QueueHandler(ex, transaction_manager, filename);
		Thread qh_thread = new Thread(queue_handler);
		qh_thread.start();

		try {
			qh_thread.join(); // waits for QueueHandler thread to finish
			while(!transaction_manager.isEmpty()){} // while the TransactionManager is not empty, wait
			transaction_manager.stopQueue(); // when ThreadPoolExecutor is empty set _live flag to false to stop the TransactionManager
			tm_thread.join(); //waits for the TransactionManager thread to finish
			ex.awaitTermination(5, TimeUnit.SECONDS); // waits for the ThreadPoolExecutor to terminate
			ex.shutdown(); // shuts down ThreadPoolExecutor
			watcherThread.join(); // waits for the watcher thread to finish
			System.out.println("All threads have terminated"); // termination message printed

		} catch (InterruptedException e) {
			e.printStackTrace();
		}

	}


} // SimController

