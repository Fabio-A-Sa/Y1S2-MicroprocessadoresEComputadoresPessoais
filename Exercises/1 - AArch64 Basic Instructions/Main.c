  // Created on April, 2021
// @author: Fábio Araújo de Sá

#include <stdio.h>
#include <stdlib.h>

extern int decrement(int number);
extern long higher(long number1, long number2);
extern long absolute(long number);
extern int half(long number);
extern long sum(int min, int max, int range);
extern long bits(long number);
extern int compair(long number1, long number2);
extern int pairs(long *array, long size);
extern int alphabetic(long int begin, long int end, int letterA, int letterZ);
extern int sequence1(long int number, int compar);
extern int sequence2(long int number, int compar);

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
	long int numbers[] = {0, 1, 2, -1, 3952369588353213235, 38982912, 1126453957886081};
	for (int y = 0 ; y < 7 ; y++ ) {
		printf("Number %ld receives a value %ld\n", numbers[y], half(numbers[y]));
	}
}

void sum_values ()
{
	printf("\nExercise 3A, sum range: \n");
	int min = 11;
	int max = 101;
	int range = 10;
	printf("Sum min %d until max %d with range %d is %ld\n", min, max, range, sum(min, max, range));
}

void how_many_bits()
{
	printf("\nExercise 3B, bits == 1: \n");
	long numbers[] = {3, 4, 2, 7, 34, 6, 2, 8, 12};
	for (int k = 0 ; k < 9 ; k++ ) {
		printf("Number %ld have %ld bits 1 in binary representation\n", numbers[k], bits(numbers[k]));
	}
}

void same_bits()
{
	printf("\nExercise 3C, how many matched bits in current pair of integers: \n");
	long numbers[][2] = {{1, 2}, {-4, -15}, {0, 5}, {6, -1}, {67, 91}, {-15, -62}};
	for (int idx = 0 ; idx < 6 ; idx ++ ) {
		long first_number = numbers[idx][0];
		long second_number = numbers[idx][1];
		printf("Numbers %ld and %ld have %d bits in same position\n", first_number, second_number, compair(first_number, second_number));
	}
}

void how_many_pairs()
{
	printf("\nExercise 3D, how many even numbers is in current array of integers: \n");
	long size = 10;
	long numbers[][10] = {	{1, 3, 4, 62, 3, 2, 4, 5, 7, 7}, {8, 3, 4, 61, 3, 2, 3, 5, 9, 7}, {43, 3, 40, 62, 321, 2, 44, 25, 72, 70},
							{1, 32, 45, 62, 39, 2, 14, 5, 70, 4}, {1, 32, 4, 62, 33, 2, 43, 5, 75, 7}, {5, 3, 2, 62, 3, 2, 4, 5, 766, 90} };

	for (int i = 0 ; i < 6 ; i++ ) {
		printf("Sequence ");
		for (int j = 0 ; j < size ; j++ ) {
			printf("%ld ", numbers[i][j]);
		}
		printf("have %ld even numbers\n", pairs(numbers[i], size));
	}
}

void alphabetic_counter()
{
	long int begin = 0x0AF008;
	long int end = 0x0BB00F;
	int letterA = 0x41;
	int letterZ = 0x54;
	int answer = alphabetic(begin, end, letterA, letterZ);
	printf("\nExercise 3E: \nHere are %d letters between 0x0AF008 and 0x0BB00F", answer);

}

void without_overlap()
{
	long int number = 1073741823;
	int compar = 31;
	int answer = sequence1(number, compar);
	printf("\nExercise 3F1: \nNumber %ld comparated to %d is %d.", number, compar, answer);
}

void with_overlap()
{
	long int number = 1073741823;
	int compar = 31;
	int answer = sequence2(number, compar);
	printf("\nExercise 3F2: \nNumber %ld comparated to %d is %d.", number, compar, answer);
}

int main()
{
	decrement_a_unit();
	higher_number();
	absolute_value();
	half_numbers();
	sum_values();
	how_many_bits();
	same_bits();
	how_many_pairs();
	alphabetic_counter();
	without_overlap();
	with_overlap();
	return EXIT_SUCCESS;
}
