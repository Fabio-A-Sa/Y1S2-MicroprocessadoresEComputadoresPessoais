// Created on April, 2021
// @author: Fábio Araújo de Sá

#include <stdio.h>
#include <stdlib.h>

extern int SOMA_V(int *a, int n);
extern int MAX_W(int *vector, int dimension);
extern long int MIN_DW(long int *vector, int dimension);
extern int MAX_HW(int *vector, int dimension);
extern int MED_DW(long *vector, int dimension);
extern int N_RANGE(int *vector, int dimension, int min, int max);
extern int LENGTH(char *array);
extern int FIND(char*array, char letter);
extern int VOWELS(char *array);
extern int UPPER(char *array);

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
	printf("%d is %d.\n", v3[dimension-1], answer);
}

void max_in_word_vector() {

	printf("\nExercise 2A:\n");
	int vector[] = {34, -21, 4, 97, 3, 8, 93, 5, -42, 6, 134, -221};
	int dimension = sizeof(vector) / sizeof(vector[0]);
	printf("Max of numbers ");
	for (int i = 0 ; i < dimension ; i++ ) {
		printf("%d, ", vector[i]);
	}
	int result = MAX_W(vector, dimension);
	printf("is %d.", result);
}

void min_in_doubleword_vector() {

	printf("\nExercise 2B:\n");
	long int vector[] = {-4532545, 2345, -266236, -262534, 234626, 25246, 25546, -8487, -4252, 24456, -125234, -221};
	int dimension = sizeof(vector) / sizeof(vector[0]);
	printf("Min of numbers ");
	for (int i = 0 ; i < dimension ; i++ ) {
		printf("%ld, ", vector[i]);
	}
	long int result = MIN_DW(vector, dimension);
	printf("is %ld.", result);
}

void max_in_half_word_vector(){

	printf("\nExercise 2C:\n");
	int vector[] = {-2, 3, 0, -2, 2, 5, -8, -4, 6, -12, -29};
	int dimension = sizeof(vector) / sizeof(vector[0]);
	printf("Max of numbers ");
	for (int i = 0 ; i < dimension ; i++ ) {
		printf("%d, ", vector[i]);
	}
	int result = MAX_HW(vector, dimension);
	printf("is %d.", result);
}

void medio_doubleword_vector(){

	printf("\nExercise 2D:\n");
	long vector[] = {-2, 3, 0, -2, 2, 5, -8, -4, 6, -12, -29};
	int dimension = sizeof(vector) / sizeof(vector[0]);
	printf("Average of numbers ");
	for (int i = 0 ; i < dimension ; i++ ) {
		printf("%ld, ", vector[i]);
	}
	int result = MED_DW(vector, dimension);
	printf("is %d.", result);
}

void numbers_in_range() {

	printf("\nExercise 2E:\n");
	int a = 4;
	int b = 8;
	int vector[] = {0, 3, 4, 7, 1, 5, 9, 4, 2, 8, 4, 3, 9, 3, 5, 7, 3, 7};
	int dimension = sizeof(vector) / sizeof(vector[0]);
	printf("Numbers in vector: ");
	for (int i = 0 ; i < dimension ; i++ ) {
		printf("%d ", vector[i]);
	}
	int answer = N_RANGE(vector, dimension, a, b);
	printf("\nThere are %d numbers between %d and %d in vector.", answer, a, b);
}

void len() {

	printf("\nExercise 3A:\n");
	char word1[] = "hello world";
	char word2[] = "Fábio Araújo de Sá";
	printf("Length of 'hello world' is %d\nLength of 'Fábio Araújo de Sá' is %d.", LENGTH(word1), LENGTH(word2));
}

void find_char() {

	printf("\nExercise 3B:\n");
	char word1[] = "hello world";
	char word2[] = "Fabio Araujo de Sa";
	printf("'hello world' have %d letters 'a'\n'Fabio Araujo de Sa' have %d letters 'a'.", FIND(word1, 'a'), FIND(word2, 'a'));
}

void find_vowels() {

	printf("\nExercise 3C:\n");
	char word1[] = "hello world";
	char word2[] = "Fabio Araujo de Sa";
	printf("There are %d vowels in'hello world'\nThere are %d vowels in 'Fabio Araujo de Sa'", VOWELS(word1), VOWELS(word2));
}

void find_upper() {

	printf("\nExercise 3D:\n");
	char word1[] = "hello WorLd";
	char word2[] = "Fabio Araujo de Sa";
	printf("There are %d upper letters in'hello WorLd'\nThere are %d upper letters in 'Fabio Araujo de Sa'", UPPER(word1), UPPER(word2));
}

int main(void)
{
	total_sum();
	max_in_word_vector();
	min_in_doubleword_vector();
	max_in_half_word_vector();
	medio_doubleword_vector();
	numbers_in_range();
	len();
	find_char();
	find_vowels();
	find_upper();
	return EXIT_SUCCESS;
}
