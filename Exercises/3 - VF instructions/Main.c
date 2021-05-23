#include <stdio.h>
#include <stdlib.h>

extern double op1(double B, double M, double N);
extern double op2(double W, double X);
extern double expr(int A, int B, int C, int D);
extern double area (int r);
extern double dist(int x, int y, int w, int z);

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
	double E = expr(A, B, C, D);
	printf("\nAnswer is %f\n", E);
}

void area_circle()
{
	int r1 = 4;
	int r2 = 7;
	printf("Area of %d is %f\n", r1, area(r1));
	printf("Area of %d is %f\n", r2, area(r2));
}

void distance()
{
	int xA = 3, xB = 5, yA = 6, yB = 19;
	double answer = dist(xA, yA, xB, yB);
	printf("Area is %f\n", answer);
}

int main ()
{
	doub1();
	doub2();
	expression();
	area_circle();
	distance();
	return 0;
}

