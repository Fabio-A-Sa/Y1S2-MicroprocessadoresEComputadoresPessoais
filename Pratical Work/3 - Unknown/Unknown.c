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

  unsigned char ops[] = {'L', 0, 33, 'X'};
  res = OpMat(ncol, nlin, ops, mat1);
  for (i=0; i<nlin; i++)
  {
      for (j=0; j<ncol; j++)
          printf("%*d", 4, mat1[i*ncol+j]);
      printf("\n");
  }
  printf("\nE isto");

  unsigned char ops2[] = {'L', 1, 0, 'X'};   // Exemplo a)
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
  printf("\nE isto");

  unsigned char ops3[] = {'L', 3, 50, 'X'};   // Exemplo a)
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
  printf("\nE isto");
  return EXIT_SUCCESS;
}
