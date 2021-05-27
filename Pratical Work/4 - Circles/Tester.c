#include <stdio.h>
#include <stdlib.h>

extern void closestCircle(unsigned int np, float *vp, unsigned int nc, double *vc, int *id);

void cout(unsigned int np, int ID[])
{
	for (int i = 0 ; i < np ; i++ ) {
		printf("%d ", ID[i]);
	}
	printf("\n");
}

int main()
{
	unsigned int NP, NC;

	printf("TEST 1: ");
	NP = 2;
	NC = 4;
	int ID1[] = {-1, -1};
	float VP1[] = {-1.0, 0.0, 2.7, 1.15};
	double VC1[]= {-4.0, -1.0, 1.0, -3.89, 5.4, 0.51, 2.0, 1.0, 1.0, 3.0, 1.21, 0.9};
	closestCircle(NP, VP1, NC, VC1, ID1);
	cout(NP, ID1);

	printf("TEST 2: ");
	NP = 2;
	NC = 3;
	int ID2[] = {-1, -1};
	float VP2[] = {-3.0, 1.0, -3.0, -1.5};
	double VC2[]= {0.0, -6.0, 6.0, -10.0, 0.0, 10.75, 0.0, 0.0, 5.0};
	closestCircle(NP, VP2, NC, VC2, ID2);
	cout(NP, ID2);



	return EXIT_SUCCESS;
}
