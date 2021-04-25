// Created on February 21, 2021
// @author: Fábio Araújo de Sá

#include <stdio.h>
#include <stdlib.h>

extern int decrement(int number);
extern int higher(int number1, int number2);

void decrement_a_unit()
{
	printf("\nExercise 1A, decrement a unit: \n");
	int numbers[] = {-10, 5, 7, 2, 9, 2, 16, 5, 6, 8};
	for (int i = 0 ; i < 10 ; i++) {
		printf("Result of number %d is %d\n", numbers[i], decrement(numbers[i]));
	}
}

void higher_number()
{
	printf("\nExercise 1B, chose a higher number: \n");
	int numbers[][2] = {{1, 2}, {-4, -15}, {0, 5}, {6, -1}, {67, 91}, {-15, -62}};
	for (int idx = 0 ; idx < 7 ; idx ++) {
		int n1 = numbers[idx][0];
		int n2 = numbers[idx][1];
		printf("The higher value between %d and %d numbers is %d\n", n1, n2, higher(n1, n2));
	}
}

int main()
{
	decrement_a_unit();
	higher_number();
	return EXIT_SUCCESS;
}