package CO2017.exercise2.nt161;

/**
 * Transaction
 * 
 * Stores information about a transaction
 * and controls the execution of a transaction object
 * 
 * @author 169018358
 * @version $ID: Transaction.java version 8 $
 * @last_modified 15/03/18
 */
 
/**
 * Class to represent a Transaction
 */

public class Transaction extends java.lang.Object implements java.lang.Runnable {
	private final TransactionManager transactionmanager;
	private final char transaction_id; // ID of the transaction
	private final int runtime; // represents the length of runtime for the transaction
	private final java.util.HashSet<Resource> resourceSet; // the set of resources that are needed by this process

	// constructor just sets the four attributes
	public Transaction(TransactionManager tM, char i, int r,
			java.util.HashSet<Resource> resources){
		transactionmanager = tM; 
		transaction_id = i;
		runtime = r;
		resourceSet = resources;
	}

	// accessor method that returns the ID of the transaction
	public char getID(){
		return transaction_id;
	}

	// accessor method which returns the resources that are needed by the transaction 
	public java.util.HashSet<Resource> getDependencies()
	{
		return resourceSet;

	}

	// behaviour of a Transaction when executed
	@Override
	public void run(){
		try {
			// obtain all the resources needed
			transactionmanager.obtainLock(this);
			// message displayed which indicates that the transaction has started running
			System.out.println(this.toString() + " is running");
			// pause for 100 times the length of the transaction runtime
			Thread.sleep(runtime*100);
			// message displayed which indicates that the transaction has finished running
			System.out.println(this.toString() + " finished running");
			// free all resources in use
			transactionmanager.freeUp(this);
		} 
		catch (InterruptedException e) {
			e.printStackTrace();
		}

	}

	// produces a string representation of a transaction
	// prints out the transaction ID, the resources required and the runtime of the transaction
	public java.lang.String toString()
	{
		return String.valueOf(transaction_id) + resourceSet.toString() + ":" + runtime;

	}

} // Transaction


