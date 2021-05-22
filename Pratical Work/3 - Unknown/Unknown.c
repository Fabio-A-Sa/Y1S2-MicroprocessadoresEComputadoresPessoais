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

	  return EXIT_SUCCESS;
}
