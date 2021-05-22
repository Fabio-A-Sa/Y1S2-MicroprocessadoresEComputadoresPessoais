#include <stdio.h>
#include <stdlib.h>

extern int OpMat(char nc, char nl, unsigned char *o, unsigned char *v);

int main(void)
{
	int  res;
	char i, j;
  unsigned char ncol = 3;  // Nº colunas da matriz
  unsigned char nlin = 4;  // Nº linhas da matriz
  unsigned char mat1[] = { 29, 127,  11, 255,
                         100,   5, 200,   0,
                           1,  29,   0, 128 };

  unsigned char ops[] = {'C', 0, 33, 'X'};
  res = OpMat(ncol, nlin, ops, mat1);
  for (i=0; i<nlin; i++)
  {
      for (j=0; j<ncol; j++)
          printf("%*d", 4, mat1[i*ncol+j]);
      printf("\n");
  }

  unsigned char ops2[] = {'C', 1, 0, 'X'};   // Exemplo a)
  unsigned char mat2[] = { 29, 127,  11, 255,
                         100,   5, 200,   0,
                           1,  29,   0, 128 };

  res = OpMat(ncol, nlin, ops2, mat2);
  for (i=0; i<nlin; i++)
  {
      for (j=0; j<ncol; j++)
          printf("%*d", 4, mat2[i*ncol+j]);
      printf("\n");
  }

  unsigned char ops3[] = {'C', 2, 50, 'X'};   // Exemplo a)
  unsigned char mat3[] = { 29, 127,  11, 255,
                         100,   5, 200,   0,
                           1,  29,   0, 128 };

  res = OpMat(ncol, nlin, ops3, mat3);
  for (i=0; i<nlin; i++)
  {
      for (j=0; j<ncol; j++)
          printf("%*d", 4, mat3[i*ncol+j]);
      printf("\n");
  }
  return EXIT_SUCCESS;
}
