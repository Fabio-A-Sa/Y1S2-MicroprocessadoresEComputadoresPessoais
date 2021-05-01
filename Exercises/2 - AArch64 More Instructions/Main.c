// Created on April, 2021
// @author: Fábio Araújo de Sá

#include <stdio.h>
#include <stdlib.h>

extern int SOMA_V(int *a, int n);

void total_sum() {

	printf("\nExercise 1:\n");
	int dimension, answer;

	printf("Sum of numbers ");
	int v1[] = {3, -1, 8, 0, -3};
	dimension = sizeof(v1) / sizeof(v1[0]);
	for (int i = 0; i < dimension - 1 ; i++ ) {
		printf("%d, ", v1[i]);
	}
	answer = SOMA_V(v1, dimension);
	printf("%d is %d", v1[dimension-1], answer);

	printf("\nSum of numbers ");
	int v2[] = {5, 3, -10, 5, -42, 9, 92, 182, 0, 3, 1, 6, -152};
	dimension = sizeof(v2) / sizeof(v2[0]);
	for (int i = 0; i < dimension - 1 ; i++ ) {
		printf("%d, ", v2[i]);
	}
	answer = SOMA_V(v2, dimension);
	printf("%d is %d", v2[dimension-1], answer);

	printf("\nSum of numbers ");
	int v3[] = {0, 0, -3, 0, 0, 3, 0, 3, -2, -1, 0};
	dimension = sizeof(v3) / sizeof(v3[0]);
	for (int i = 0; i < dimension - 1 ; i++ ) {
		printf("%d, ", v3[i]);
	}
	answer = SOMA_V(v3, dimension);
	printf("%d is %d", v3[dimension-1], answer);
}

int main(void)
{
	total_sum();
	return EXIT_SUCCESS;
}
