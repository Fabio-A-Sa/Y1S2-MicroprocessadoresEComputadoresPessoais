#include <stdio.h>
#include <stdlib.h>

extern int ContPar(long *array, long size);

int main(void) {
    long size = 11;
    long array[] = {0, 2, 3, 5, 2, 6, 1, 7, 8, 2, 10};

    long evens = ContPar(array, size);

    printf("Resultado: %ld", evens);

    return 0;
}
