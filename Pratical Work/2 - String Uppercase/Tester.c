/*
 * Escreva uma sub-rotina que aceita duas sequências: seq_A e seq_B. Os elementos de seq_B são todos distintos e apenas podem ser letras minúsculas, sem acentos ou outras alterações. 
 * A sub-rotina altera para a sua versão maiúscula, todos os carateres de seq_A que surgem na seq_B.
 * Apenas carateres que sejam letras minúsculas, sem acentos ou outras alterações, deverão ser alterados.
 * Para além de alterar a seq_A, a sub-rotina deve retornar o número de carateres de seq_A que são alterados (este valor é um inteiro sem sinal).
 * Sequências de carateres são terminadas pelo carater nulo, o qual é codificado com o número 0; Consulte uma tabela ASCII (ex: http://www.asciitable.com/). 
 * A sub-rotina deve ter o nome SelectedUpperCase e aceitar os seguintes argumentos pela ordem indicada:
	- endereço-base de seq_B;
	- endereço-base de seq_A.
*/

#include <stdio.h>
#include <stdlib.h>

extern unsigned int SelectedUpperCase(char *seq_B, char *seq_A);

void test (char seq_A[], char seq_B[]) {

	printf("\nTEST: \nInput: %s\n", seq_A);
	unsigned int solution = SelectedUpperCase(seq_B, seq_A);
	printf("Output: %s\nKey: %s\nResult: %d\n", seq_A, seq_B, solution);
}

int main()
{
    char seq_A[] = "Esta frase deverá ter alguns dos seus carateres alterados para maiúscula!";
    char seq_B[] = "afuily";
    test (seq_A, seq_B);

    char seq_C[] = "Qualquer CENA só para ver se funcioNA";
    char seq_D[] = "simplekey";
    test (seq_C, seq_D);

    char seq_E[] = "             ";
    char seq_F[] = "something";
    test (seq_E, seq_F);

    char seq_G[] = "Esta frase não deverá ter alguns dos seus carateres alterados para maiúscula!";
    char seq_H[] = "";
    test (seq_G, seq_H);

    char seq_I[] = "ESTÁ TUDO EM MAÚSCULA, NÃO ALTERAR NADA!";
    char seq_J[] = "abcdefghijklmnopqrstuvwxyz";
    test (seq_I, seq_J);

    char seq_K[] = "the quick brown fox jumps over the lazy dog";
    char seq_L[] = "abcdefghijklmnopqrstuvwxyz";
    test (seq_K, seq_L);

    char seq_M[] = "Esta frase deverá ter alguns dos seus carateres alterados para maiúscula!";
    char seq_N[] = "xwz";
    test (seq_M, seq_N);

    return EXIT_SUCCESS;
}