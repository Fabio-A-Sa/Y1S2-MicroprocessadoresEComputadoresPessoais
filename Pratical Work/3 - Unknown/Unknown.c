#include <stdio.h>
#include <stdlib.h>

extern int OpMat(char nc, char nl, unsigned char *o, unsigned char *v);

int main(void)
{
	  int  res;
	  char i, j;
	  unsigned char ncol = 4;  // Nº colunas da matriz
	  unsigned char nlin = 3;  // Nº linhas da matriz
	  unsigned char mat1[] = { 29, 127,  11, 255,
							 100,   5, 200,   0,
							   1,  29,   0, 128 };

	  unsigned char ops[] = {'C', 1, 33, 'L', 2, 123, 'P', 0, 2, 99, 'X'};
	  res = OpMat(ncol, nlin, ops, mat1);
	  for (i=0; i<nlin; i++)
	  {
		  for (j=0; j<ncol; j++)
			  printf("%*d", 4, mat1[i*ncol+j]);
		  printf("\n");
	  }

	  return EXIT_SUCCESS;
}
