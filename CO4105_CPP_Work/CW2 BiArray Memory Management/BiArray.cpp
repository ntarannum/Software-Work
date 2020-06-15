#include "BiArray.h"
#include <cmath>
#include <string>

using namespace std;

// default constructor
// setting initial values of size (of internal array) to zero, and capacity (of total array) to initial capacity
// allocating memory for the biArray of size equal to the capacity
// setting the head and tail pointers of the internal array to the middle
BiArray::BiArray() {
	// IMPLEMENT ME
	size = 0;
	capacity = INITIALCAP;
	biArray = new int[capacity];
	int temp_head_index = floor((double)capacity/2);
	int temp_tail_index = ceil((double)capacity/2);
	head = biArray + temp_head_index;
	tail = biArray + temp_tail_index;
}

// value constructor
// setting the capacity of external array to the initial capacity unless the low threshold multiplied by the size is
// greater than the initial capacity
// this size of the internal array is set to the size passed in the parameters
// allocating memory for the biArray of size equal to the capacity
// setting the head and tail pointers of internal array to the middle
// copying array contents into memory allocated for the new biArray
BiArray::BiArray(int arr[], int size)  {
	// IMPLEMENT ME
	if((LO_THRESHOLD*size) > INITIALCAP)
	{
		capacity = LO_THRESHOLD*size;
	}
	else
	{
		capacity = INITIALCAP;
	}
	this->size = size;
	biArray = new int[capacity];
	int head_index = ((capacity - size)/2);
	head = biArray + head_index - 1;
	tail = biArray + head_index + size;
	
	for(int i = 0; i<size; i++) 
	{
		biArray[head_index+i] = arr[i];
	}
}

// destructor
// setting the pointers of the head and tail to nullptr to ensure there are no dangling pointers
// deleting the memory allocated for the biArray
BiArray::~BiArray() {
	// IMPLEMENT ME
	head = nullptr;
	tail = nullptr;
	delete [] biArray;
}

//  copy method for the copy constructor
//  Initialises another biArray object using a biArray object that has been created
void BiArray::copy_(const BiArray& other){
	this->size = other.size;
	this->capacity = other.capacity;
	this->biArray = new int[capacity];
	for(int i = 0; i < size; i++)
	{
		biArray[i] = other.biArray[i];
	}
	this->head = other.head;
	this->tail = other.tail;
}


// copy constructor
// we are doing a deep copy
// copy constructor is a constructor which creates an object by initializing
// it with an object of the same class, which has been created previously, using the copy method
BiArray::BiArray(const BiArray& other) {
	// IMPLEMENT ME
	copy_(other);
}


// move constructor
// we are swapping the contents essentially
// converting the resources owned by an rvalue object to be moved to an lvalue without copying
// then we are doing a bit of housekeeping and removing the reference to the other array
// again to ensure there are no dangling pointers
BiArray::BiArray(BiArray&& other) {
	// IMPLEMENT ME
	size = other.size;
	capacity = other.capacity;
	head = other.head;
	tail = other.tail;
	biArray = other.biArray;
	other.size = 0; 
	other.capacity = 0; 
	other.head = nullptr;
	other.tail = nullptr; 
	other.biArray = nullptr;
}

// copy assignment
// first we test for the same object
// we delete memory that was allocated if they aren't the same
// then we copy the new data
// finally return a reference to the current object
BiArray& BiArray::operator=(const BiArray& other) {
	// IMPLEMENT ME
	// below are just stub code
	if(&other != this)
	{
		delete [] biArray;
		copy_(other);
	}
	return *this;
}

// move assignment
// first we test for the same object
// we delete memory that was allocated if they aren't the same
// then we swap the data
// we do do a clean up
// finally return a reference to the current object
BiArray& BiArray::operator=(BiArray&& other) {
	// IMPLEMENT ME
	// below are just stub code
    if(this != &other) //added
    {
	delete [] biArray; 
	size = other.size;
	capacity = other.capacity;
	head = other.head;
	tail = other.tail;
	biArray = other.biArray;
	other.size = 0; 
	other.capacity = 0; 
	other.head = nullptr; 
	other.tail = nullptr; 
	other.biArray = nullptr;
    }
	return *this;
}

// v is set to the value of the i-th element (by reference).
// if i is out of bounds then it will return false
// else function returns true and sets v to the same value as the i-th element

bool BiArray::get(int i, int& v) const {
	// IMPLEMENT ME
	// below are just stub code
	if(i < size && i >= 0)
	{
		v = *(head+1+i);
		return true;
	}
	else
	{
		return false;
	}
}

// i-th element is set to the value of v
// if i is out of bounds then it will return false
// else function returns true and sets i-th to the same value as v
bool BiArray::set(int i, int v) {
	// IMPLEMENT ME
	// below are just stub code
	if (i < size && i >= 0)
	{
		*(head+1+i) = v;
		return true;
	}
	else
		return false;
}

// by overloading the operator this allows access to members of the biArray
// the compiler to can then return the corresponding element from the biArray
// by passing the index in the parameters
int BiArray::operator[](int i) const {
	// IMPLEMENT ME
	// below are just stub code
	return *(head + i + 1);
	
}

// by overloading the operator this allows access to members of the biArray
// the compiler to can then return the reference to the corresponding element from the biArray
// by passing the index in the parameters
int& BiArray::operator[](int i) {
	// IMPLEMENT ME
	// below are just stub code
	return *(head + i + 1);
}

void BiArray::push_back(int v) {
	// IMPLEMENT ME

	// if the tail position is less than the capacity then
    // place the value in the tail position
    // move the tail pointer one position to the right
    // and increase the size of the internal array
	if(tail < biArray + capacity)
	{
		*tail = v;
		tail += 1;
		size += 1;
	}
	else
	{
	    // we only do the following if we need to resize the biArray
		// pointer which also points to the biArray, so we can copy contents to a new memory that will be allocated
		// without losing access to the original array
	    int* tempArray = biArray;
		
		// checking if capacity is less than initial cap
		// if so, then we set capacity to the initial cap
		// otherwise we set it to the low threshold multiplied by the size of the internal array
		if(capacity < INITIALCAP)
		{
			capacity = INITIALCAP;
		}
		else
		{
			capacity = LO_THRESHOLD*size;
		}

		// allocating memory for biArray using new capacity
		biArray = new int[capacity];
		
		// copying contents of tempArray into the middle of the new biArray
		for(int i = 0; i < size; i++)
		{
			biArray[i + ((capacity-size)/2)] = *(head + i + 1);
		}
		
		// redefining head and tail pointers since these have moved
		int head_index = ((capacity - size)/2) - 1;
		head = biArray + head_index;
		tail = head + size + 1;

		// adding the value to the end of the array
		// moving the tail pointer one position to the right
		// and increasing the size of the internal array
		*tail = v;
		tail += 1;
		size += 1;

		// deleting the memory allocated for the temporary array
		delete [] tempArray; 
		tempArray = nullptr;
	}
		
}

bool BiArray::pop_back() {
	// IMPLEMENT ME
	// below are just stub code

    // if size of the internal array is not equal to 0
    // if so the tail pointer position is moved one position to the left
    // size is also reduced by 1
    // the function returns true
    // else the function returns false
	if(size != 0)
	{
		tail -= 1;
		size -= 1;

		// checking if capacity if greater than the high threshold multiplied by the size of the internal array
		// if this is true, we have to resize the array
		// so we do another check which looks at if the low threshold multiplied by the size is greater
		// than the initial capacity
		// if so then we set that as the capacity else we set the initial capacity as the capacity
		if(capacity > (HI_THRESHOLD * size))
		{
            // pointer which also points to the biArray, so we can copy contents to a new memory that will be allocated
            // without losing access to the original array
			int* tempArray = biArray;

			if((LO_THRESHOLD * size) > INITIALCAP)
			{
				capacity = LO_THRESHOLD * size;
			}
			else
			{
				capacity = INITIALCAP;
			}

            // allocating memory for biArray using new capacity
			biArray = new int[capacity];

            // copying contents of tempArray into the middle of the new biArray
			for(int i = 0; i < size; i++)
			{
				biArray[i + ((capacity - size) / 2)] = *(head + i + 1);
			}
			
			// redefining head and tail pointers since these have moved
			int head_index = ((capacity - size) / 2) - 1;
			head = biArray + head_index;
			tail = head + size + 1;

            // deleting the memory allocated for the temporary array
			delete [] tempArray;
			tempArray = nullptr;
		}
		return true;
	}
	else
	{ 
		return false;
	}
	
}

void BiArray::push_front(int v) {
	// IMPLEMENT ME
    // if the head position is greater than or equal to the beginning of the biArray
    // then place the value in the head position
    // move the head pointer one position to the left
    // and increase the size of the internal array
	if(head >= biArray)
	{
		*head = v;
		head -= 1;
		size += 1;
	}
	else
	{
        // we only do the following if we need to resize the biArray
        // pointer which also points to the biArray, so we can copy contents to a new memory that will be allocated
        // without losing access to the original array
		int* tempArray = biArray;

        // checking if capacity is less than initial cap
        // if so, then we set capacity to the initial cap
        // otherwise we set it to the low threshold multiplied by the size of the internal array
		if(capacity < INITIALCAP)
		{
			capacity = INITIALCAP;
		}
		else
		{
			capacity = LO_THRESHOLD*size;
		}

        // allocating memory for biArray using new capacity
		biArray = new int[capacity];

        // copying contents of tempArray into the middle of the new biArray
		for(int i = 0; i < size; i++)
		{
			biArray[i + ((capacity - size) / 2)] = *(head + i + 1);
		}

        // redefining head and tail pointers since these have moved
		int head_index = ((capacity - size) / 2) - 1;
		head = biArray + head_index;
		tail = head + size + 1;

        // then place the value in the head position
        // move the head pointer one position to the left
        // and increase the size of the internal array
		*head = v;
		head -= 1;
		size += 1;

        // deleting the memory allocated for the temporary array
		delete [] tempArray;
		tempArray = nullptr;
	}
}

bool BiArray::pop_front() {
	// IMPLEMENT ME
	// below are just stub code

    // if size of the internal array is not equal to 0
    // if so the head pointer position is moved one position to the right
    // size is also reduced by 1
    // the function returns true
    // else the function returns false
	if(size != 0)
	{
		head += 1;
		size -= 1;

        // checking if capacity if greater than the high threshold multiplied by the size of the internal array
        // if this is true, we have to resize the array
        // so we do another check which looks at if the low threshold multiplied by the size is greater
        // than the initial capacity
        // if so then we set that as the capacity else we set the initial capacity as the capacity
		if(capacity > (HI_THRESHOLD * size))
		{
            // pointer which also points to the biArray, so we can copy contents to a new memory that will be allocated
            // without losing access to the original array
		    int* tempArray = biArray;
			
			if((LO_THRESHOLD * size) > INITIALCAP)
			{
				capacity = LO_THRESHOLD * size;
			}
			else
			{
				capacity = INITIALCAP;
			}

            // allocating memory for biArray using new capacity
			biArray = new int[capacity];

            // copying contents of tempArray into the middle of the new biArray
			for(int i = 0; i < size; i++)
			{
				biArray[i + ((capacity - size) / 2)] = *(head + i + 1);
			}

            // redefining head and tail pointers since these have moved
			int head_index = ((capacity - size) / 2) - 1;
			head = biArray + head_index;
			tail = head + size + 1;

            // deleting the memory allocated for the temporary array
			delete [] tempArray;
			tempArray = nullptr;
		}
		return true;
	}
	else
	{ 
		return false;
	}
}

int BiArray::getSize() const {
	// IMPLEMENT ME
	// below are just stub code
	return size;
}

int BiArray::getCapacity() const {
	// IMPLEMENT ME
	// below are just stub code
	return capacity;
}

string BiArray::print() const {
	// IMPLEMENT ME
	// below are just stub code
	std::string s = "[";
	for(int* i = head+1; i < tail; i++)
	{
		
		if(i == (tail - 1))
		{
			s += std::to_string(*i);
		}
		else 
		{
			s += std::to_string(*i) + " ";
		}
	}
	
	s += "]";
	return s;
	
}

string BiArray::printAll() const {
	// IMPLEMENT ME
	// below are just stub code
	string s = "[";
	
	for(int* i = biArray; i<=head; i++)
	{
		s += "X ";
	}
	
	for(int* j = head+1; j<tail; j++)
	{
		s += std::to_string(*j) + " ";
		
	}
	
	for(int* k = tail; k < biArray + capacity; k++)
	{
		s += (k == tail) ? ("X") : (" X");
	}
	
	s = s + "]";
	return s;
}

// first checks if lhs size is equal to rhs size, then checks if size of both is 0,
// which would mean both lhs and rhs are equal
// otherwise it iterates through and checks the dereferenced heads of lhs and rhs, if these aren't the same then
// the function returns false

bool operator==(const BiArray& lhs, const BiArray& rhs) {
	if(lhs.size == rhs.size)
	{
		if(lhs.size == 0 && rhs.size == 0) return true;
		for(int i = 0;i<lhs.size;i++)
		{
			if(*(lhs.head + i + 1) != *(rhs.head + i + 1)) return false;
		}
		return true;
	}
	else
	{
		return false;
	}
	
}


// first checks if lhs size is not equal to rhs size, if so it'll return true,
// otherwise checks if size is 0 for lhs and size is not 0 for lhs, in which case it would return false,
// which would mean both lhs and rhs are equal
// otherwise it iterates through and checks the dereferenced heads of lhs and rhs, if these aren't the same then
// the function returns true
bool operator!=(const BiArray& lhs, const BiArray& rhs) {
	if(lhs.size != rhs.size) return true;
	if(lhs.size == 0 && rhs.size != 0) return false; // double check this line
	for(int i = 0;i<lhs.size;i++){
		if(*(lhs.head + i + 1) != *(rhs.head + i + 1)) return true;
	}
	return false;
}

