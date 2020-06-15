/**
 * PollServer
 *	
 * Program which concurrently calls invocations of the voters
 *
 * @author nt161
 * @version $Id: PollServer.java 26-04-18 nt161 $
 *
 */

package CO2017.exercise3.nt161;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.SocketException;
import java.net.SocketTimeoutException;

import CO2017.exercise3.support.BallotBox;
import CO2017.exercise3.support.BallotPaper;
import CO2017.exercise3.support.VoterList;

/**
 * Class representing concurrent execution of various clients 
 */


public class PollServer {
	public static void main (String args[]) throws IOException{

		int port = Integer.valueOf(args[0]); // the first command line argument is the port number
		String file = args[1]; // the second command line argument is the candidates file 

		BufferedReader inputFile = new BufferedReader(new FileReader(file)); // buffered reader object which reads the candidates file
		BallotPaper bp = new BallotPaper(inputFile); // creates a ballot paper using the candidates file
		VoterList voterList = new VoterList(1000, 1000); // creates a new voter list with valid voter IDs of 1000 - 1999
		BallotBox ballotbox = new BallotBox(bp, voterList); // creates a new ballot using the voter list and ballot paper

		// creates a server object with the port number entered in the command line argument
		try (ServerSocket server = new ServerSocket(port)){
			
			while(true){
				// server time out 10 seconds
				server.setSoTimeout(10000);
				try{
					// if a connection is made then create a vote handler object
					VoteHandler votehandler = new VoteHandler(server.accept(), bp, voterList, ballotbox);
					// creates a new thread which will handle the clients
					Thread vh_thread = new Thread(votehandler);
					// start executing the thread
					vh_thread.start();
				}
				catch(SocketTimeoutException e){
					// if the ballotbox is closed i.e. the stop condition is met then exit the while loop
					if(!ballotbox.isOpen()){
						break;
					}
				}
			}
			// String which describes the current state of the vote using
			// and declares the winner of the election
			System.out.println(ballotbox.toString());
			// terminates the current call to the thread
			System.exit(0);
		}
		catch(SocketException e){
			System.out.println("Client Disconnected");
		}
	}

}










