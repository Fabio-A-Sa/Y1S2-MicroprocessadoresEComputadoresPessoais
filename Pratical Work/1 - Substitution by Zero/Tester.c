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


    int x = 20;                                        //X0
    int tamanho = 8;                                  //X1
    int ve[] = {0,0,0,-21,0,19,0,19};     //X2 pointer
    int res;

    res = CheckABS(x, tamanho, ve);
    printf("Mudou estes valores: %d\n", res);

    return EXIT_SUCCESS;
}
