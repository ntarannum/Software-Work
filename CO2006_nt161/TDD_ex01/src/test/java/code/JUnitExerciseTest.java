package code;
import java.util.*;
import static code.JUnitExercise.ints;
import static code.JUnitExercise.list;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.arrayContaining;
import static org.hamcrest.Matchers.arrayWithSize;
import static org.hamcrest.Matchers.containsInAnyOrder;
import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.hamcrest.core.Every.everyItem;
import static org.hamcrest.text.IsEmptyString.isEmptyOrNullString;
import static org.hamcrest.text.IsEmptyString.isEmptyString;

//import java.awt.List;

import org.hamcrest.Matchers;
import org.junit.Test;

//import junit.framework.Assert;

public class JUnitExerciseTest {

	// exercise 1.1
    @Test
    public void sizeOfList() {
    	
    	assertThat(list, hasSize(3));
    }
    // exercise 1.2
    @Test
    public void containsElementsInAnyOrder() {
    	
    	assertThat(list, Matchers.containsInAnyOrder(2, 4, 5));
    }
    // exercise 1.3
    @Test
    public void elementsGreaterThan1() {
    	
    	assertThat(list, Matchers.everyItem(greaterThan(1)));
    }
    
    // exercise 2.1
    @Test
    public void sizeOfArray() {
    	
    	assertThat(ints, Matchers.arrayWithSize(4));
    }
    
    // exercise 2.2
    @Test
    public void containsElementsInOrder() {
    	
    	assertThat(ints, Matchers.arrayContaining(7, 5, 16, 12));
    }
    
	// exercise 3.1
    @Test
    public void isStringEmpty() {
 	
    	assertThat("", Matchers.isEmptyString());
    }
    
    // exercise 3.2
    @Test
    public void isStringEmptyOrNull() {
	 	
	 	assertThat("", Matchers.isEmptyOrNullString());
	}
	 

	
}
