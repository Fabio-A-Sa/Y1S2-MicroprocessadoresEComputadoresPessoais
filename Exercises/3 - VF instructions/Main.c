#include <stdio.h>
#include <stdlib.h>

extern double op1(double B, double M, double N);

void doub()
{
	double B = 7.8, M = 3.6, N = 7.1;
	double P = op1(B, M, N);
	printf("\nAnswer is %f\n", P);
}

int main ()
{
	doub();
	return 0;
}

