package CO2017.exercise2.nt161;

/**
 * TransactionManager
 * 
 * Manages the different transaction queues.
 *
 * @author 169018358
 * @version $ID: TransactionManager.java version 8 $
 * @last_modified 15/03/18
 */
 
import java.util.HashMap;
import java.util.HashSet;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;


/**
 * Class for managing the despatch and resources of a sequence of Transaction requests. 
 */

public class TransactionManager extends java.lang.Object implements java.lang.Runnable {

	private final BlockingQueue<Transaction> _arrivalQueue; // responsible for holding all the transaction arrivals
	private HashMap<Character,Resource> _resources;         // keeps all the resources currently registered to the transaction manager
	private boolean _changed;                               // used for checking whether the state of the arrivalQueue had changed and for triggering a print out of the state of the arrivalQueue
	private boolean _live;                                  // is used by the run method; once this is false, the run method should terminate
	private final ThreadPoolExecutor exec;                  // ThreadPoolExecutor executes the transactions
	private final HashSet<Transaction> activeTransactions;  // attribute to store the currently active transactions 
	private final HashSet<Transaction> blockedTransactions; // attribute to store the currently blocked transactions 
	private final int interval;                             // polling interval

	// constructor that just sets the 4 attributes
	// and sets other attributes to their default values
	public TransactionManager(ThreadPoolExecutor ex, 
			int size, 
			java.util.HashMap<java.lang.Character,Resource> rs_list, 
			int intval){
		_arrivalQueue       = new ArrayBlockingQueue<Transaction>(size);
		activeTransactions  = new HashSet<Transaction>(size);
		blockedTransactions = new HashSet<Transaction>(size);
		_resources = rs_list;
		exec = ex;
		interval = intval;
		_changed = true;
		_live = true;
	}

	// checks if the arrivalQueue is full
	// to ensure that transactions are not added to the queue
	// when there is no space in the queue
	public Boolean isArrivalQueueFull(){
		if(_arrivalQueue.remainingCapacity() != 0){
			return false;
		}else{
			return true;
		}
	}

	// returns if the state of the transaction manager has changed
	public boolean isChanged(){
		return _changed;
	}


	// sets the value of _live to false to stop the queue
	// this will stop the while loop in SimController
	public void stopQueue(){
		_live = false; 
	}

	// checks if the _arrivalQueue is empty
	public boolean isEmpty(){
		if(_arrivalQueue.isEmpty()){
			if(activeTransactions.isEmpty()){
				if(blockedTransactions.isEmpty()){
					return true;
				}
			}
		}
		return false;
	} 

	// gets the ID of the resource
	// adds the resource to the _resources map
	public Resource getResource(char resource){
		return _resources.get(resource);
	}

	// if the remaining capacity of the _arrivalQueue is greater than 0
	// then the transaction is added to the queue
	// the _changed flag is set to true
	public void enQueue(Transaction t) 
			throws java.lang.InterruptedException
	{
		if(_arrivalQueue.remainingCapacity() > 0) {
			_arrivalQueue.add(t);
			_changed = true;
		}
	}

	// critical process so this must be synchronized
	@SuppressWarnings("unlikely-arg-type")
	synchronized public void obtainLock(Transaction t)
			throws java.lang.InterruptedException{
		// iterates through the dependencies of each transaction
		// and sets the resource as unavailable
		for (Resource r : t.getDependencies()) {
			while(!(_resources.get(r.getID()).isAvailable())) wait();
			_resources.get(r.getID()).unset();
		}
		// prints that the transaction has obtained the required resources
		System.out.println(t.toString() + " obtained all resources");
		// removes the transaction from the blocked transactions queue
		blockedTransactions.remove(t);
		// adds the transaction to the active transactions queue
		activeTransactions.add(t);
		// _changed flag set to true
		_changed = true;
		// wakes up all other threads waiting on this object's monitor
		notifyAll();
	}


	// again a critical section so synchronized
	@SuppressWarnings("unlikely-arg-type")
	synchronized public void freeUp(Transaction t) {
		System.out.println(t.toString() + " released all resources");
		// iterates through the dependencies of each transaction
		// and sets the resource as available
		for (Resource r : t.getDependencies()) {
			_resources.get(r.getID()).set();
		}
		// removes the transaction from the active transactions queue
		activeTransactions.remove(t);
		// _changed flag set to true
		_changed = true;
		// wakes up all other threads waiting on this object's monitor
		notifyAll();
	}


	// behaviour of the TransactionManager when executed
	@Override
	public void run() {
		// while the _live flag is true
		while(_live == true) {
			try {
				// checks if the _arrivalQueue is empty
				if(!_arrivalQueue.isEmpty()){
					// thread sleeps for a period of time equal to 100 times the polling interval 
					Thread.sleep(100*interval);
					// every poll interval (*100) take the first Transaction from the arrival queue 
					Transaction transac = _arrivalQueue.poll((interval*100), TimeUnit.MILLISECONDS);
					// adds the new transaction to the set of blocked transactions
					blockedTransactions.add(transac);
					// and start executing it (using the ThreadPoolExecutor) 
					exec.execute(transac);
					// displays a message that the transaction has been retrived from the arrival queue
					System.out.println(transac.toString() + " retrieved from the arrival Queue");
					// _changed flag set to true
					_changed = true;
				}
			}
			catch (InterruptedException e) {
				e.printStackTrace();
			} 
		}
	}


	// a string representation of the arrival, active and blocked queues
	public java.lang.String toString(){
		_changed = false;
		String activeQueue;
		String blockedQueue;
		String arrivalQueue;

		if(activeTransactions.isEmpty()){
			activeQueue = "[Empty]";
		}else{
			activeQueue = activeTransactions.toString();
		}

		if(_arrivalQueue.isEmpty()){
			arrivalQueue = "[Empty]";
		}else{
			arrivalQueue = _arrivalQueue.toString();
		}

		if(blockedTransactions.isEmpty()){
			blockedQueue = "[Empty]";
		}else{
			blockedQueue = blockedTransactions.toString();
		}

		return "Queue  | " + arrivalQueue + "\nActive | " + activeQueue + "\nBlocked| " + blockedQueue;
	}

} // TransactionManager
