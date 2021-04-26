/*
Exercício de programação 1
Escrever uma sub-rotina que substitui por 0 (zero) os elementos de uma sequência cujo valor absoluto é maior que o valor positivo X, devolvendo o número de elementos modificados.
Os elementos da sequência são do tipo signed word. A sub-rotina deve ter o nome CheckABS (checkabs.s) e aceitar os seguintes argumentos pela ordem indicada:
X0: valor X (do tipo unsigned word);
X1: número de elementos da sequência (do tipo unsigned word);
X2: endereço-base da sequência.
*/

#include <stdio.h>
#include <stdlib.h>

extern int CheckABS( int numx, int tam, int *seq);

int main(void) {
    int x = 5;
    int tamanho = 8;
    int ve[] = {7, -8, -23, 56, 20, -10, 0, 40};
    int res;

    res = CheckABS(x, tamanho, ve);
    printf("Foram modificados %d elementos da sequencia ve[]", res);

    return EXIT_SUCCESS;
}
