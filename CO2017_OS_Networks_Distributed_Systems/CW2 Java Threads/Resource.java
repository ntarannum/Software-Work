package CO2017.exercise2.nt161;

/**
 * Resource
 * 
 * Stores information about the resource.
 * 
 * @author 169018358
 * @version $ID: Resource.java version 2 $
 * @last_modified 15/03/18
 */

import java.util.Objects;

/**
 * Class to represent a Resource.
 */

public class Resource extends java.lang.Object {

	private final Character resource_id; // id of the resource
	private volatile boolean available;  // a flag which represents if the resource is available


	// constructor just sets the two attributes
	public Resource(char i){
		resource_id = i;
		available = true;
	}

	// checks the availability of the resource
	public boolean isAvailable(){
		return available;
	}

	// accessor method that returns the resource's ID
	public char getID(){
		return resource_id;
	}

	// method sets the resource as available
	public void set(){
		available = true;
	}

	// method sets the resource as unavailable
	public void unset(){
		available = false;
	}

	// method returns a suitable hashcode of the resource using the resource's ID
	public int hashCode(){
		return Objects.hash(resource_id);
	}

	// produces a string representation of the resource's ID
	public java.lang.String toString(){
		String string_id = String.valueOf(resource_id);
		return string_id;
	}

} // Resource
