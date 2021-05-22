/*
Pretende-se implementar a sub-rotina OpMat capaz de realizar uma sequência de operações sobre uma matriz com NCOL colunas e NLIN linhas.

As dimensões e os elementos da matriz são valores de 8 bits sem sinal. A matriz é representada por um vetor com NCOL*NLIN elementos formado pela sequência de linhas da matriz. Desta forma, o elemento da coluna col e linha lin ocupa a posição lin*NCOL+col do vetor.

A sequência de operações a realizar é formada por carateres que definem operações, algumas das quais possuem argumentos (valores de 8 bits sem sinal). As operações são:

'L', lin, n - atribui o valor n a todos os elementos da linha lin (0 <= lin < NLIN),
'C', col, n - atribui o valor n a todos os elementos da coluna col (0 <= col < NCOL),
'P', col, lin, n - atribui o valor n ao elemento da coluna col e linha lin,
'B' - "binariza" a matriz, isto é, valores no intervalo [0; 127] são substituídos por 0 e os restantes são substituídos por 255,
'O', n - conta o número de ocorrências do valor n na matriz,
'X' - indica fim das operações a realizar pela sub-rotina, estando sempre presente numa sequência de operações. Pode ocorrer em qualquer posição da sequência (ver exemplo a) em baixo).
A sequência de operações pode conter várias operações do mesmo tipo.

A sub-rotina OpMat recebe, por ordem, os seguintes argumentos:

NCOL, número de colunas da matriz (0 <= NCOL < 256),
NLIN, número de linhas da matriz (0 <= NLIN < 256),
OPS, endereço base do vetor de operações a realizar,
MAT, endereço base do vetor formado pelos elementos da matriz.
A sub-rotina deve devolver o resultado da última operação 'O' realizada, ou -1 se 'O' não fizer parte da sequência de operações.

A operação 'O' deve ser realizada pela sub-rotina ocorr, a invocar em OpMat, a qual recebe os seguintes argumentos:

valor a pesquisar em w0,
endereço do vetor a pesquisar em x1,
tamanho do vetor a pesquisar rm w2.
O resultado de ocorr deve ser devolvido em w0.
*/

#include <stdio.h>
#include <stdlib.h>

extern int OpMat(char nc, char nl, unsigned char *o, unsigned char *v);

void printmatrix(unsigned char *m, int res, unsigned char nlin, unsigned char ncol)
{
	char i, j;
	  printf("Res = %d\n", res);
	  for (i=0; i< nlin; i++)
	  {
		  for (j=0; j< ncol; j++)
			  printf("%*d", 4, m[i*ncol+j]);
		  printf("\n");
	  }
}

int main(void)
{
	  int  res;
	  unsigned char ncol, nlin;

	  printf("\nTest 1\n");
	  ncol = 4;
	  nlin = 3;
	  unsigned char mat1[] = { 29, 127, 11, 255, 100, 5, 200, 0, 1, 29, 0, 128};
	  unsigned char ops1[] = {'O', 1, 'X'};
	  res = OpMat(ncol, nlin, ops1, mat1);
	  printmatrix(mat1, res, nlin, ncol);

	  printf("\nTest 2\n");
	  ncol = 5;
	  nlin = 3;
	  unsigned char mat2[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
	  unsigned char ops2[] = {'P', 0, 1, 100, 'O', 50, 'L', 2, 89, 'X', 'B', 'X'};
	  res = OpMat(ncol, nlin, ops2, mat2);
	  printmatrix(mat2, res, nlin, ncol);


	  printf("\nTest 3\n");
	  ncol = 3;
	  nlin = 5;
	  unsigned char mat3[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
	  unsigned char ops3[] = {'P', 0, 1, 100, 'O', 0, 'L', 2, 89, 'B', 'O', 0, 'X'};
	  res = OpMat(ncol, nlin, ops3, mat3);
	  printmatrix(mat3, res, nlin, ncol);

	  printf("\nTest 4\n");
	  ncol = 0;
	  nlin = 5;
	  unsigned char mat4[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
	  unsigned char ops4[] = {'P', 0, 1, 100, 'O', 0, 'L', 2, 89, 'B', 'O', 0, 'X'};
	  res = OpMat(ncol, nlin, ops4, mat4);
	  printmatrix(mat4, res, nlin, ncol);

	  printf("\nTest 5\n");
	  ncol = 3;
	  nlin = 5;
	  unsigned char mat5[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
	  unsigned char ops5[] = {'X'};
	  res = OpMat(ncol, nlin, ops5, mat5);
	  printmatrix(mat5, res, nlin, ncol);

	  printf("\nTest 6\n");
	  ncol = 6;
	  nlin = 6;
	  unsigned char mat6[] = {100, 102, 110, 29, 3, 4, 6, 23, 74, 75, 32, 66, 4, 2, 4, 1, 4, 5, 2, 5, 2, 5, 2, 7, 3, 7, 3, 173, 190, 29, 5, 207, 6, 23, 127, 128};
	  unsigned char ops6[] = {'X'};
	  res = OpMat(ncol, nlin, ops6, mat6);
	  printmatrix(mat6, res, nlin, ncol);

	  printf("\nTest 7\n");
	  ncol = 6;
	  nlin = 6;
	  unsigned char mat7[] = {100, 102, 110, 29, 3, 4, 6, 23, 74, 75, 32, 66, 4, 2, 4, 1, 4, 5, 2, 5, 2, 5, 2, 7, 3, 7, 3, 173, 190, 29, 5, 207, 6, 23, 127, 128};
	  unsigned char ops7[] = {'P', 0, 0, 250, 'L', 5, 250, 'O', 75, 'B', 'C', 2, 99, 'O', 0, 'X'};
	  res = OpMat(ncol, nlin, ops7, mat7);
	  printmatrix(mat7, res, nlin, ncol);

	  printf("\nTest 8\n");
	  ncol = 1;
	  nlin = 6;
	  unsigned char mat8[] = {100, 102, 110, 220, 3, 219};
	  unsigned char ops8[] = {'P', 0, 0, 250, 'L', 5, 250, 'O', 75, 'B', 'C', 0, 99, 'O', 99, 'C', 0, 0, 'X'};
	  res = OpMat(ncol, nlin, ops8, mat8);
	  printmatrix(mat8, res, nlin, ncol);

	  printf("\nTest 9\n");
	  ncol = 6;
	  nlin = 1;
	  unsigned char mat9[] = {100, 102, 110, 220, 3, 219};
	  unsigned char ops9[] = {'P', 0, 0, 250, 'L', 0, 250, 'O', 250, 'B', 'C', 0, 99, 'O', 99, 'C', 0, 0, 'X'};
	  res = OpMat(ncol, nlin, ops9, mat9);
	  printmatrix(mat9, res, nlin, ncol);

	  printf("\nTest 10\n");
	  ncol = 6;
	  nlin = 2;
	  unsigned char mat10[] = {100, 102, 110, 220, 3, 219, 100, 102, 110, 220, 3, 219};
	  unsigned char ops10[] = {'B', 'O', 5, 'X'};
	  res = OpMat(ncol, nlin, ops10, mat10);
	  printmatrix(mat10, res, nlin, ncol);

	  return EXIT_SUCCESS;
}
