#include <stdio.h>
#include <stdlib.h>

extern double op1(double B, double M, double N);
extern double op2(double W, double X);

void doub1()
{
	double B = 7.8, M = 3.6, N = 7.1;
	double P = op1(B, M, N);
	printf("\nAnswer is %f\n", P);
}

void doub2()
{
	double W = 7, X = 7.1;
	double Y = op2(W, X);
	printf("\nAnswer is %f\n", Y);
}

int main ()
{
	doub1();
	doub2();
	return 0;
}

