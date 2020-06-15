/*
  Author: nt161
  Date: October 2018
  
  A linear search algorithm implemented in parallel using openmp
 */

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
int main()
{
    int i, thread_id;
	int n = 99000000;
	int key = n-1;
	int *a = malloc(sizeof(int)*n);
	double start;
		
	for (i = 0; i < n; i++) {
      a[i] = i;
   }
   
   start = omp_get_wtime();
   printf("Max threads %d\n", omp_get_max_threads());
	#pragma omp parallel private(i)
    {   
    	printf("thread %d\n", thread_id);
        #pragma omp for
        for(i=0; i<n; i++)
        {
            if(a[i] == key)
            {
                printf("Key found. Array position = %d. Time taken = %lf \n", i+1, omp_get_wtime() - start);
            }
        }
    }
    
	return 0;
}



