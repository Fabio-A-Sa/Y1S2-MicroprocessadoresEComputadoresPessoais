// Created on April, 2021
// @author: Fábio Araújo de Sá

/*
Escrever uma sub-rotina que substitui por 0 (zero) os elementos de uma sequência cujo valor absoluto é maior que o valor positivo X, devolvendo o número de elementos modificados. Os elementos da sequência são do tipo signed word.
A sub-rotina deve ter o nome CheckABS e aceitar os seguintes argumentos pela ordem indicada:
--> valor X (do tipo unsigned word);
--> número de elementos da sequência (do tipo unsigned word);
--> endereço-base da sequência.
*/

#include <stdio.h>
#include <stdlib.h>

extern int CheckABS( int numx, int tam, int *seq);

void test (int numero, int tamanho, int arr[]) {

	int expected = 0;
	for (int i = 0 ; i < tamanho ; i++ ) {
		if (abs(arr[i]) > numero) {
			expected += 1;
		}
	}
	printf("Tamanho: %d \n", tamanho);
	printf("Comparador: %d \n", numero);
	printf("Numeros originais: ");
	for (int i = 0 ; i < tamanho ; i++ ) {
		printf("%d, ", arr[i]);
	}
	int result = CheckABS(numero, tamanho, arr);
	printf("\nNumeros modificados: ");
	for (int i = 0 ; i < tamanho ; i++ ) {
		printf("%d, ", arr[i]);
	}
	printf("\nExpected: %d\nResult: %d \n", expected, result);
	if (expected == result) {
		printf("PASSED\n");
	}
	else {
		printf("NOT PASSED\n");
	}
}

int main(void) {

    int numero, tamanho;

    printf("\nTest 1 \n");
    tamanho = 8;
    numero = 20;
	int a1[] = {70, 80, 23, 56, -20, 56, 41, 40};
	test (numero, tamanho, a1);

    printf("\nTest 2 \n");
    tamanho = 0;
    numero = 0;
	int a2[] = {};
	test (numero, tamanho, a2);

    printf("\nTest 3 \n");
    tamanho = 0;
    numero = -20;
	int a3[] = {};
	test (numero, tamanho, a3);

    printf("\nTest 4 \n");
    tamanho = 10;
    numero = 0;
	int a4[] = {7, -8, -23, 56, 20, -20, 0, 40, 8, 40};
	test (numero, tamanho, a4);

    printf("\nTest 5 \n");
    tamanho = 8;
    numero = 1;
	int a5[] = {1, 1, -1, 1, -9, -1, 1, 4};
	test (numero, tamanho, a5);

    printf("\nTest 6 \n");
    tamanho = 5;
    numero = 2;
	int a6[] = {0, 0, 0, 0, 0};
	test (numero, tamanho, a6);

    printf("\nTest 7 \n");
    tamanho = 7;
    numero = 3;
	int a7[] = {7, -8, -23, 56, 20, -20, -53};
	test (numero, tamanho, a7);

    printf("\nTest 8 \n");
    tamanho = 8;
    numero = 80;
	int a8[] = {7, -8, -23, 56, 20, -20, 0, 40};
	test (numero, tamanho, a8);

    printf("\nTest 9 \n");
    tamanho = 25;
    numero = 3;
	int a9[] = {-8, -23, 56, 20, -20, 0, 40, 5, -65, 2, 90, -12, 3, -6, 2, 9, 0, -23, -5, 3, 6, 21, 7, 1, 76};
	test (numero, tamanho, a9);

    printf("\nTest 10 \n");
    tamanho = 3;
    numero = 0;
	int a10[] = {-8, 0, 8};
	test (numero, tamanho, a10);

    return EXIT_SUCCESS;
}
