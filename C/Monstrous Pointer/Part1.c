#include <stdio.h>

// Function named fucker that returns a pointer to an array of 20 integers
int (*fucker())[20]
{
    int arr[20] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                          11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
    return &arr;
}

int main() 
{
    // Pointer that points to an array of 20 integer
    int (*y)[20] = fucker();
    // Pointer that points to the first eleemnt's memory of the array of 290 integer
    int *x = *y;
    // Two same ways to iterate through 20 element
    for (int i = 0; i < 20; i++)
    {
        printf("%d ", (*y)[i]);
    }
    printf("\n");
    for (int i = 0; i < 20; i++)
    {
        printf("%d ", x[i]);
    }
    return 0;
}