package uk.ac.le.cs.CO3090.cw1;

/**
 * @author Yi Hong
 * CO3090/CO7090 Coursework 1 
 *     
 * CounterInterface      
 */


public interface CounterInterface {
	

	
	/**
	 * count() method should record:
	 * 
	 *  (1) any pages it visited. 
	 *      marks a URL as 'visited' by 
	 *      adding it to 'visited' list
	 *  
 	 *  (2) the total letter count.
	 *  
	 *  (3) letter frequency for 
	 *      EVERY page it 
	 *      visited (case-insensitive) 
	 *      
	 *  (4) letter frequency for 
	 *      ALL pages it visited  
	 *      (case-insensitive) 
	 *  
	 *   You should use appropriate thread-safe types to store the results
	 *  
	 *  * skip URLs that have already 
	 *  been visited by other threads 
	 * 
	 * @param URL 
	 * @throws InterruptedException
	 */
	public void count(String URL) throws InterruptedException; 
	
	
	
	/**
	 * printStatistics() print results   
	 *                                     
	 * Sample output:
	 *  
	 *
		Total number of characters:145203
		Pages visited:43
		a = 8.881%
		b = 1.358%
		c = 3.724%
		d = 3.548%
		e = 12.294%
		f = 1.494%
		g = 1.783%
		h = 3.693%
		i = 7.674%
		j = 0.072%
		k = 0.959%
		l = 5.272%
		m = 2.151%
		n = 6.612%
		o = 8.001%
		p = 1.898%
		q = 0.072%
		r = 7.356%
		s = 6.631%
		t = 8.410%
		u = 3.247%
		v = 0.955%
		w = 1.463%
		x = 0.267%
		y = 2.029%
		z = 0.133%
	 
	 (results may vary depending on your 
	 crawling strategy)
	 
	 *               
	 * @throws InterruptedException
	 * @return   
	 *   
	 */
	public void printStatistics(); 
	

	
}
