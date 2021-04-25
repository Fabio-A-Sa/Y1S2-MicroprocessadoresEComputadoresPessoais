  // Created on April, 2021
// @author: Fábio Araújo de Sá

#include <stdio.h>
#include <stdlib.h>

extern int decrement(int number);
extern long higher(long number1, long number2);
extern long absolute(long number);
extern int half(long number);

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
	long numbers[][2] = {{1, 2}, {-4, -15}, {0, 5}, {6, -1}, {67, 91}, {-15, -62}};
	for (int idx = 0 ; idx < 6 ; idx ++) {
		long n1 = numbers[idx][0];
		long n2 = numbers[idx][1];
		printf("The higher value between %ld and %ld numbers is %ld\n", n1, n2, higher(n1, n2));
	}
}

void absolute_value()
{
	printf("\nExercise 1C, absolute numbers: \n");
	long numbers[] = {-1, -6, 3, 382, -23, 2, 0, -13, 9, 24, -5, -32};
	for (int x = 0 ; x < 12 ; x++) {
		printf("Absolute value of %ld is %ld\n", numbers[x], absolute(numbers[x]));
	}
}

void half_numbers()
{
	printf("\nExercise 1D, 32 + 32: \n");
	long numbers[] = {0, 1, 2, -1, 3952369588353213235, 38982912, 1126453957886081};
	for (int y = 0 ; y < 7 ; y++ ) {
		printf("Number %ld receives a value %ld\n", numbers[y], half(numbers[y]));
	}
}

int main()
{
	decrement_a_unit();
	higher_number();
	absolute_value();
	half_numbers();
	return EXIT_SUCCESS;
}