/**
 * VoteHandler
 *	
 * Program which executes the server operation
 *
 * @author nt161
 * @version $Id: VoteHandler.java 26-04-18 nt161 $
 *
 */

package CO2017.exercise3.nt161;

import CO2017.exercise3.support.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.Socket;

/**
 * Class representing communication from server side
 */


public class VoteHandler implements Runnable{
	
	private Socket client; // socket connected to client
	private Writer output; // writer that sends information to the client
	private BufferedReader input; // reader that reads 
	
	private char client_vote; // the client's vote
	private int client_bnum; // the client's ballot number
	private int client_vid; // the client's voter ID

	private char server_vote; // the server's vote
	private int server_bnum; // the server's ballot number
	private int server_vid; // the server's vote

	private BallotBox ballot; // declaration of ballot box object 
	private VoterList list; // declaration of voter list object
	private BallotPaper bp; // declaration of ballot paper object
	
	// VoteHandler object constructor, takes a socket, ballotpaper, voterlist and ballotbox objects as parameters
	public VoteHandler(Socket clientsocket, BallotPaper ballotpaper, VoterList voters, BallotBox ballotbox) {
		client = clientsocket;
		bp = ballotpaper;
		list = voters;
		ballot = ballotbox;

		try {
			// creates a reader and a writer which listens to the client's socket 
			input = new BufferedReader(new InputStreamReader(client.getInputStream(),"UTF-8"));
			output = new OutputStreamWriter(client.getOutputStream());

		}
		catch (IOException e) {
			System.err.println(e);
			System.exit(1);
		}
	}
	

	public void run() {

		try {
			String line_fromVoter ; // line received from the client
			String[] cl_s_comm; // communication array between server and client
			
			// then the client response is read by the server
			line_fromVoter = input.readLine();
			client_vid = Integer.valueOf(line_fromVoter); // client voter ID is stored
			server_vid = client_vid; // client's voter ID is assigned to server's voter ID
			
			// if the server voter ID is equal to 0
			// a message is displayed which says "closing poll"
			// then the poll is closed and client connection is closed 
			if (server_vid == 0){
				System.out.println("Closing Poll");
				ballot.closePoll();
				client.close();
			}
			// else if the server voter ID is not valid an error message is displayed
			// a special message is sent to the client and the client connection is closed
			else if(!list.validVoter(server_vid)){
				System.out.println("Invalid voter ID");
				output.write(client_vid + ":" + 0 + ":INVALID_VID" + "\r\n");
				output.flush();
				client.close();
			}
			// else if the server voter ID has already voted an error message is displayed
			// a special message is sent to the client and the client connection is closed
			else if(list.checkVoterState(server_vid) == list.VOTED){
				System.out.println("client has voted");
				output.write(client_vid + ":" + 0 + ":DUPLICATE" + "\r\n");
				output.flush();
				client.close();
			}
			else{
				// else a ballot request message is displayed for the connected client IP address
				System.out.println("Vote " + client.getInetAddress()+" request ballot for client " + client_vid);
				server_bnum = ballot.getBallotForVoter(server_vid); // the server ballot number is stored in 
				output.write(server_vid + ":" + server_bnum +":BALLOT" + "\r\n");
				output.flush();

				// prints out a message which shows ballot number and the server voter ID
				System.out.println("Ballot paper number sent" + server_bnum + " for " + server_vid);
				// sends the ballot paper and a special message to the client
				output.write(bp.toString()+ "0:END" + "\r\n");
				output.flush();

				line_fromVoter = input.readLine(); // then the client response is read by the server
				cl_s_comm = line_fromVoter.split(":"); // this ensures that the message received is split into separate chunks using the colon as a delimiter

				server_vid = Integer.valueOf(cl_s_comm[0]); // the first value is the server voter ID
				client_bnum = Integer.valueOf(cl_s_comm[1]); // the second value in the array is the client ballot number
				server_vote = cl_s_comm[2].charAt(0); // the last value is 

				// if the vote is not valid then an error message is displayed and the client connection is closed
				if(!bp.getBallotIDs().contains(server_vote)){
					System.out.println("Invalid vote");
					client.close();
				}
				// however if there are no discrepancies in the server and client ballot numbers and voter IDs
				// then a confirmation message is displayed
				// and the vote is completed and sent to the client
				else if (server_vid == client_vid && server_bnum == client_bnum){
					System.out.println("Got vote: " + server_vote);
					ballot.completeVote(server_vid, server_vote);
					output.write(server_vid + ":" + client_bnum + ":" + server_vote + ":OK\r\n");
					output.flush();
				}
				// however if there are discrepancies in the server and client ballot numbers and voter IDs
				// then a abort message is displayed
				// special message is sent to the client
				// and the vote is aborted
				// connection to the client is closed
				else{
					System.out.println("Abort vote");
					output.write(client_vid + ":" + client_bnum + ":" + client_vote + ":ABORT\r\n");
					ballot.abortVote(server_vid);
					client.close();
				}
			}
		}
		catch (NumberFormatException e){
			System.out.println("Invalid format");
			System.out.println("Connection closed");
		}
		catch (IOException e) {
			System.err.println(e);
			System.exit(1);
		}

	}

}







