package CO3090.assignment2;


public interface RFSInterface extends java.rmi.Remote {

    //Question (2.1)
    public Object executeQuery(SearchCriteria searchCriteria) throws java.rmi.RemoteException;

}
