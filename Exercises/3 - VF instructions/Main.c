#include <stdio.h>
#include <stdlib.h>

extern double op1(double B, double M, double N);
extern double op2(double W, double X);
extern double exp(int A, int B, int C, int D);

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

void expression()
{
	int A = 1, B = 2, C = 3, D = 4;
	double E = exp(A, B, C, D);
	printf("\nAnswer is %f\n", E);
}

int main ()
{
	doub1();
	doub2();
	expression();
	return 0;
}

