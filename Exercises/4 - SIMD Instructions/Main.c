#include <stdio.h>
#include <stdlib.h>

extern void somaV (double * v1, double * v2, double * v3, int n);
extern long int intern (int * n1, int *n2, int n);

void sum()
{
	double v1[] = { 3.2, 4.2, -4.1, 9.4 };
	double v2[] = { 3.2, 4.2, -4.1, 9.4 };
	double v3[4];
	somaV(v1, v2, v3, 4);
	printf("Sum of two vectors: ");
	for (int n = 0 ; n < 4 ; n++) {
		printf("%f ", v3[n]);
	}
}

void ProdInt()
{
	int v1[] = { 3, 4, -4, 9 };
	int v2[] = { 3, 4, -4, 9 };
	printf("Inten product is: %ld", intern(v1, v2, 4));
}

int main ()
{
	sum();
	ProdInt();
	return 0;
}
