/*
  Author: nt161
  Date: October 2018
  
  Part 1
 */

#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

/*
  Ex1
  
 */
 
int main(int argc, char **argv) {
	int i;
	int N = 5;
	double A[] = {3,2,4,1,2}, B[] = {1,4,3,2,6}, C[N], D[N];
	const double c = 4;
	const double x = 7;
	double y;
	
	#pragma omp parallel for
	for (i = 0; i < N; i++)
	{
		y = sqrt(A[i]);
		D[i] = y + A[i] / (x * x);
	}
	
	return 0;

}


/*
  Ex2
  
 */

int main(int argc, char **argv) {
	int i;
	int N = 5;
	double A[] = {3,2,4,1,2}, B[] = {1,4,3,2,6}, C[N], D[N];
	const double c = 4;
	const double x = 7;
	double y;
	
	#pragma omp parallel
	{
		#pragma omp for nowait
		for (i = 0; i < N; i++)
		{
			D[i] = x * A[i] + x * B[i];
		}
	 	
		#pragma omp for
	 	for (i = 0; i < N; i++)
	 	{
			C[i] = c * D[i];
	 	}
	} // end omp parallel
	
	return 0;

}

/*
  Ex3
  This cannot be parallelised and the explanation is given in the report
 */

int main(int argc, char **argv) {
	int i;
	int N = 5;
	double A[] = {3,2,4,1,2}, B[] = {1,4,3,2,6}, C[N], D[N];
	const double c = 4;
	const double x = 7;
	double y;
	
	#pragma omp parallel for
	for (int i = 1; i < N; i++)
	{
		A[i] = B[i] – A[i – 1];
	}
	
	return 0;

}

/*
  Ex4
  
 */

int main(int argc, char **argv) {
	
	double A[2] = {}, B[4] = {4,3,2,6}, C[2] = {2,2};


void mxv_row(int m, int n, double *A, double *B, double *C)
{
	int i, j;
	
	#pragma omp parallel for private(i,j) shared(m,n,A,B,C)
	for (i=0; i<m; i++)
	{
		A[i] = 0.0;
		for (j=0; j<n; j++)
		{
			A[i] += B[i*n+j]*C[j];
		}
	}

}

	mxv_row(2,2,A,B,C);

	return 0;

}




