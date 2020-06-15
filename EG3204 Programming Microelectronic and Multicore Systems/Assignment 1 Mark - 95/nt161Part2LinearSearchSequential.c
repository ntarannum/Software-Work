/*
  Author: nt161
  Date: October 2018
  
  A linear search algorithm
 */

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
int main()
{
    int i;
	int n = 99000000;
	int key = n-1;
	int *a = malloc(sizeof(int)*n);
	double start;
	
	//creates an array of length 99000000 with values up to 98999999
	for (i = 0; i < n; i++) 
	{
      a[i] = i;
	}
   	
   	//starts timing the run time of the program
   	start = omp_get_wtime();
    
    //loop iterates through the array until it finds the key
    for(i=0; i<n; i++)
    {
    	//if the element in the array is the same as the key the time taken for execution
        if(a[i] == key)
        {
            printf("Key found. Array position = %d. Time taken = %lf \n", i+1, omp_get_wtime() - start);
        }
    }
    
	return 0;
}
