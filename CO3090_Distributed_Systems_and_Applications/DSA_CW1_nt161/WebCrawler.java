package uk.ac.le.cs.CO3090.cw1;

import java.util.*;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author nt161
 *
 */
public class WebCrawler implements Runnable, CounterInterface {
	
	 public final static int MAX_PAGES_NUM=50; 
	 public final static int TIME_OUT=10000;
	 public final static int MAX_QUEUE_SIZE=20000;
	 public final static int MAX_THREAD_NUM=10;
	 public final static int MAX_CHAR_COUNT=1000000;
	 public final static String ALPHABET="abcdefghijklmnopqrstuvwxyz";

	 static BlockingQueue<String> urlQueue = new ArrayBlockingQueue<String>(MAX_QUEUE_SIZE); //blocking queue
	 static ArrayList<String> visited = new ArrayList<String>();
	 static List<String> syncVisited=Collections.synchronizedList(visited); //making the list for visited web pages synchronised to ensure it is thread safe
	 																	    //ensures that only one thread can access that list
	 static ConcurrentHashMap<Character, Integer> results = new ConcurrentHashMap<>();
	 private HashMap<Character, Integer> letterfreq = new HashMap<>(); //map that contains the results of the frequencies for each URL that is visited object
	 static ThreadPoolExecutor executorPool = (ThreadPoolExecutor) Executors.newFixedThreadPool(MAX_THREAD_NUM); //creating a threadpool to 
	 static Boolean timedOut = false; //this is used
	 private static final Semaphore semaphore = new Semaphore(MAX_THREAD_NUM); //used to ensure mutual exclusion
	 
	 private static WebCrawler webCrawler;
	 
	 int current_character_count=0; //stores the current character count
	 static AtomicInteger total_character_count = new AtomicInteger(0); //stores the total character count
	 
	@Override
	public void run() {
		String website;
		try {
			website = urlQueue.poll(TIME_OUT,TimeUnit.MILLISECONDS); //using a blocking queue so it is a thread safe type
																	 //we assign URL of a website to the string object
			if(website != null) {
				//we only run the count method if polling the queue hasn't returned null
					count(website);
			}
			else {
				timedOut = true;	//else if it is null then timedOut is set to true
			}
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	@Override
	public synchronized void count(String URL) throws InterruptedException{
		if(!syncVisited.contains(URL) && syncVisited.size() < MAX_PAGES_NUM) { //checks if the visited list doesn't contains the URL and the size of the list is less than the maximum number of pages 
			syncVisited.add(URL);											   //if so it will add the URL to the list
			String page_content=Utility.getTextFromAddress(URL);
			letterfreq = Utility.calculate(Utility.getPlainText(page_content)); //calculating the letter frequency and storing the result to the map
			for (int i=0; i<ALPHABET.length(); i++) {
				char c = ALPHABET.charAt(i);
				//System.out.println(c);
				results.put(c, results.get(c) + letterfreq.get(c)); //adding the current page statistics to the map which contains the statistics from all the pages visited
			}
			for (int i : letterfreq.values()) {	//
				if(total_character_count.get() + i < MAX_CHAR_COUNT)
					current_character_count += i;
			}
			total_character_count.getAndAdd(current_character_count); //
			ArrayList<String> list = Utility.extractHyperlinks(URL, page_content); //extracts the hyperlinks from the website
			for(String link: list){ 
				urlQueue.offer(link, TIME_OUT, TimeUnit.MILLISECONDS); //adds the links to the queue and so will stop adding links if the queue is full 
			}
			
		}
	}
	

	@Override
	public void printStatistics() {
		System.out.println("Total number of characters:" + total_character_count.get()); //prints out the total number of characters
		System.out.println("Pages visited:"+ syncVisited.size()); //prints out the number of pages visited
		for (Map.Entry<Character, Integer> entry : results.entrySet()) { //iterates through the map and prints out the percentage of each letter found overall
		    String key = entry.getKey().toString();
		    Integer value = entry.getValue();
		    float percentage = ((float)value/(float)total_character_count.get())*100;
		    System.out.println(key + " = " + percentage + "%");
		}
		
	
	}
	
	
	
	public static void main(String[] args){
		// TODO complete this method
		for (int i=0; i<ALPHABET.length(); i++) {	//Initialises the map with each letter being assigned a value of zero
			char c = ALPHABET.charAt(i);
			results.put(c, 0);
		}
		
		String baseURL = "https://www.bbc.co.uk"; //base URL where the crawling starts
		urlQueue.add(baseURL); //adding the URL to the queue
		
		while(syncVisited.size()<MAX_PAGES_NUM && total_character_count.get()<MAX_CHAR_COUNT && !timedOut) { //this will continue executing as long as the list size
			webCrawler = new WebCrawler(); //creating an instance of the WebCrawler
			Thread thread = new Thread(webCrawler);	//creates a new thread which is passed the WebCrawler instance
			try {
				semaphore.acquire(); //acquiring the semaphore
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Runnable thread_runner = () -> { //this creates a new runnable object and when the thread is run, it will release the semaphore
				try {
					thread.run();
				} finally {
					semaphore.release(); //releasing the semaphore
				}
			};
			executorPool.execute(thread_runner); //The threadpool is executed and this will be used to manage the threads
		}
		executorPool.shutdown(); //When the maximum pages has been reached, then the threadpool will be shutdown, so no new threads can run.
		try {
			executorPool.awaitTermination(60000, TimeUnit.MILLISECONDS); //this will wait for a minute until all the threads that were pending to be executed 
		} catch (InterruptedException e) {								 //to execute if it is still 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		webCrawler.printStatistics(); //prints out the total frequencies as a percentage
	}

} 