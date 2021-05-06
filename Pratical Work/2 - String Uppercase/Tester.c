/*
 * Escreva uma sub-rotina que aceita duas sequências: seq_A e seq_B. Os elementos de seq_B são todos distintos e apenas podem ser letras minúsculas, sem acentos ou outras alterações. A sub-rotina altera para a sua versão maiúscula, todos os carateres de seq_A que surgem na seq_B.
 * Apenas carateres que sejam letras minúsculas, sem acentos ou outras alterações, deverão ser alterados.
 * Para além de alterar a seq_A, a sub-rotina deve retornar o número de carateres de seq_A que são alterados (este valor é um inteiro sem sinal).
 * Sequências de carateres são terminadas pelo carater nulo, o qual é codificado com o número 0; Consulte uma tabela ASCII (ex: http://www.asciitable.com/). A sub-rotina deve ter o nome SelectedUpperCase e aceitar os seguintes argumentos pela ordem indicada:
	endereço-base de seq_B;
	endereço-base de seq_A.
*/

#include <stdio.h>
#include <stdlib.h>

extern unsigned int SelectedUpperCase(char *seq_B, char *seq_A);

int solution (char seq_B[], char seq_A[]) {

	int result = 0;
	for (int i = 0 ; i < sizeof(seq_B) ; i++ ) {
		for (int j = 0 ; j < sizeof(seq_A) ; j++ ) {
			if (seq_A[j] == seq_B[i]) {
				result ++ ;
			}
		}
	}

	return result;
}

void test (char seq_B[], char seq_A[]) {

	int sol = solution(seq_B, seq_A);
	printf("\nInput: %s\n", seq_A);
	unsigned int attemp = SelectedUpperCase(seq_B, seq_A);
	printf("Output: %s\nKey: %s\nModifications: %d %d", seq_A, seq_B, attemp, sol);
	if (sol == attemp) {
		printf("PASSED\n");
	}
	else {
		printf("NOT PASSED\n");
	}
}

int main()
{
    char seq_A[] = "Esta frase deverá ter alguns dos seus carateres alterados para maiúscula!";
    char seq_B[] = "afuily";

    test(seq_B, seq_A);
    return EXIT_SUCCESS;
}
