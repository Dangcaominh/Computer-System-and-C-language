#include <stdio.h>
// 3 cách để truyền array vào một hàm

void printArray(int arr[], int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void printArray2(int* arr, int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

void printArray3(int (*array)[], int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("%d ", (*array)[i]);
    }
    printf("\n");
}
int main()
{
    
    return 0;
}