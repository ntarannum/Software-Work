package CO3090.assignment2.server;

import java.rmi.RemoteException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Vector;

import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.jms.QueueBrowser;
import javax.jms.Session;
import javax.jms.TextMessage;

import CO3090.assignment2.FileItem;
import CO3090.assignment2.SearchCriteria;

@Stateless
@LocalBean

public class QueryReceiver implements MessageListener{
	
	@Resource(mappedName = "jms/JMSConnectionFactory")
	private ConnectionFactory connectionFactory;
	
	@Resource(mappedName = "jms/queryQueue")
	Queue queryQueue;
	
	@Resource(mappedName = "jms/resultQueue")
	Queue resultQueue;
	
	
	public QueryReceiver(){
		
	}
	
	public Object executeQuery(SearchCriteria searchCriteria) throws RemoteException {
		HashMap<String, Vector<FileItem>> map = new HashMap<String, Vector<FileItem>>();
		Vector<String> remote_filesystems = FileUtility.readDistributedFilesystemList();
		for (String filesystem: remote_filesystems)
		{
			map.put(filesystem.substring(0, filesystem.lastIndexOf('.')), FileUtility.readFS(FileUtility.fileSystemPath + filesystem));
		}
		
		return searchCriteria.execute(map);
	}
	
	
	
	public void onMessage(Message message){
		try {
			Connection connection = connectionFactory.createConnection();
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			QueueBrowser queueBrowser = session.createBrowser(queryQueue);
			MessageProducer messageProducer = session.createProducer(resultQueue);
			TextMessage textMessage = session.createTextMessage();
			Enumeration<SearchCriteria> enumeration = queueBrowser.getEnumeration();
			while(enumeration.hasMoreElements()){
				ObjectMessage objMessage = (ObjectMessage)enumeration.nextElement();
				SearchCriteria searchCriteria = (SearchCriteria)objMessage.getObject();
				Object queryResult = executeQuery(searchCriteria);
				String resultString = queryResult.toString();
				textMessage.setText(resultString);
				messageProducer.send(textMessage);
			}
			messageProducer.close();
			session.close();
			connection.close();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	

}