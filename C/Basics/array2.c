#include <stdio.h>
#include <malloc.h>

// Ba cách để access array

#define ARRAY_SIZE 10

int main()
{
    int x[ARRAY_SIZE];
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        x[i] = i + 1;
    }
    // Cách 1: Sử dụng index
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        printf("%d ", x[i]);
    }
    printf("\n");
    // Cách 2: Sử dụng pointer
    int* p = x;
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        printf("%d ", *p);
        p++;
    }
    printf("\n");
    // Cách 3: Sử dụng array pointer
    int (*q)[ARRAY_SIZE] = &x;
    // q là pointer trỏ đến mảng có kích thước ARRAY_SIZE
    for (int i = 0; i < ARRAY_SIZE; i++)
    {
        printf("%d ", (*q)[i]);
    }
    return 0;
}