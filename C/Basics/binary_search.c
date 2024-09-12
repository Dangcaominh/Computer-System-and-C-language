#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>

int compare(const void* a, const void* b)
{
    return *((int *)a) - *((int *)b);
}

// a là con trỏ đến mảng
// n là độ dài mảng
// x là biến cần tìm trong mảng
int binary_search(int* a, int x, int l, int r)
{
    if(l > r)
    {
        return 0;
    }
    else
    {
        if (a[(l + r) / 2] == x)
        {
            return 1;
        }
        else if (a[(l + r) / 2] > x)
        {
            return binary_search(a, x, l, (l + r) / 2 - 1);
        }
        else
        {
            return binary_search(a, x, (l + r) / 2 + 1, r);
        }
    }
}

int main()
{
    int n;
    int x;
    printf("Nhap do dai mang n = ");
    scanf("%d", &n);
    int *a = (int *)malloc(sizeof(int) * n);
    printf("Nhap cac phan tu cua mang: ");
    for (int i = 0; i < n; i++)
    {
        int y;
        scanf("%d", &y);
        a[i] = y;
    }
    qsort(a, n, sizeof(int), compare);
    int next = 1;
    while(next)
    {
        printf("Nhap so can tim x = ");
        scanf("%d", &x);
        if(binary_search(a, x, 0, n - 1))
        {
            printf("Co");
        }
        else
        {
            printf("Khong");
        }
        printf("\n");
        printf("Continue 0/1 ? ");
        scanf("%d", &next);
    }
    free(a);
    return 0;
}