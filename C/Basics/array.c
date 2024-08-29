#include <stdio.h>
#include <malloc.h>

// Static và dynamic array

int main()
{
    // Static array là array phải xác định trước độ dài mảng
    int x[5] = {1, 2, 3, 4, 5};
    for (int i = 0; i < 5; i++)
    {
        printf("%d ", x[i]);
    }
    printf("\n");
    printf("Nhap do dai mang: ");
    int n;
    scanf("%d", &n);
    // Dynamic array không cần phải xác định trước, nó có thể có độ dài tùy ý
    int* y = (int*)malloc(n * sizeof(int));
    for (int i = 0; i < n; i++)
    {
        y[i] = i + 1;
    }
    for(int i = 0; i < n; i++)
    {
        printf("%d ", y[i]);
    }
    free(y);
}