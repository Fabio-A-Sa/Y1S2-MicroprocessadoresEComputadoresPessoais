// Created on February 21, 2021
// @author: Fábio Araújo de Sá

#include <stdio.h>
#include <stdlib.h>

extern int decrement(int number);

void decrement_a_unit()
{
	printf("\nExercise 1A, decrement a unit: \n");
	int numbers[] = {-10, 5, 7, 2, 9, 2, 16, 5, 6, 8};
	for (int i = 0 ; i < 10 ; i++) {
		printf("Result of number %d is %d\n", numbers[i], decrement(numbers[i]));
	}
}


int main()
{
	decrement_a_unit();
	return EXIT_SUCCESS;
}
