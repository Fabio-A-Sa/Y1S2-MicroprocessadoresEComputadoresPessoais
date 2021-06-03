#include <stdio.h>
#include <stdlib.h>

extern float histo(unsigned int N, unsigned char *C, unsigned char *H);

void show(unsigned int n, unsigned char C[])
{
	unsigned char H[20] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	float answer;
	answer = histo(n, C, H);
	for (int i = 0 ; i < 21 ; i++) {
		printf("%d, ", H[i]);
	}
	printf("\nAverage: %f\n", answer);
}

int main(void)
{
	printf("\nTest 1\n");
    unsigned char C1[] = {15, 18, 5, 20, 9, 10, 1, 12, 16, 7, 14, 8, 10, 14, 14, 16};
    unsigned int size1 = 16;
    show(size1, C1);

	printf("\nTest 2\n");
	unsigned char C2[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 10, 11, 12, 13, 14, 15, 16, 17, 18, 0, 0};
    unsigned int size2 = 32;
    show(size2, C2);

	printf("\nTest 3\n");
	unsigned char C3[] = {20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20};
    unsigned int size3 = 32;
    show(size3, C3);

	printf("\nTest 4\n");
	unsigned char C4[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    unsigned int size4 = 32;
    show(size4, C4);

    return 0;
}
