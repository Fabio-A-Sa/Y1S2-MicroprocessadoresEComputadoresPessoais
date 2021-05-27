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

	printf("TEST 3: ");
	NP = 0;
	NC = 3;
	int ID3[] = {-1, -1};
	float VP3[] = {-3.0, 1.0, -3.0, -1.5};
	double VC3[]= {0.0, -6.0, 6.0, -10.0, 0.0, 10.75, 0.0, 0.0, 5.0};
	closestCircle(NP, VP3, NC, VC3, ID3);
	cout(NP, ID3);

	printf("TEST 4: ");
	NP = 4;
	NC = 0;
	int ID4[] = {-1, -1, -1, -1};
	float VP4[] = {-3.0, 1.0, -3.0, -1.5};
	double VC4[]= {0.0, -6.0, 6.0, -10.0, 0.0, 10.75, 0.0, 0.0, 5.0};
	closestCircle(NP, VP4, NC, VC4, ID4);
	cout(NP, ID4);

	printf("TEST 5: ");
	NP = 6;
	NC = 7;
	int ID5[] = {-1, -1, -1, -1, -1, -1};
	float VP5[] = {-3.0, 1.0, -3.0, -1.5, 5.5, 8.0, -7.2, 9.5, 3.2, 9.1, -3.0, -1.5};
	double VC5[]= {0.0, -6.0, 6.0, -10.0, 0.0, 10.75, 0.0, 0.0, 5.0, 0.0, -6.0, 6.0, 0.0, -6.0, 6.0, 0.0, -6.0, 6.0, 0.0, -6.0, 6.0};
	closestCircle(NP, VP5, NC, VC5, ID5);
	cout(NP, ID5);


	return EXIT_SUCCESS;
}
