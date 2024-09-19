#include <stdio.h>

// Thuật toán tính a^n với độ phức tạp O(n)
long long power(long long a, long long n)
{
    long long result = 1;
    for (int i = 0; i < n; i++)
    {
        result *= a;
    }
    return result;
}

// Thuật toán tính a^n với độ phức tạp O(log n) dùng đệ quy
long long RecursiveFastPower(long long a, long long n)
{
    long long result = 1;
    if (n == 0)
    {
        return 1;
    }
    else if(n == 1)
    {
        return a;
    }
    else
    {
        if (n % 2 == 0)
        {
            long long result = RecursiveFastPower(a, n / 2);
            result = result * result;
            return result;
        }
        else 
        {
            long long result = RecursiveFastPower(a, n / 2);
            result = a * result * result;
            return result;
        }
    }
}

// Thuật toán tính a^n với độ phức tạp O(log n) dùng vòng lặp và bit shift
long long BitShiftFastPower(long long a, long long n)
{
    long long result = 1;
    long long power = a;
    while(n > 0)
    {
        if (n % 2 == 1)
        {
            result *= power;
        }
        power *= power;
        n = n >> 1;
    }
    return result;
}

int main()
{
    long long a;
    printf("Nhap a = ");
    scanf("%lld", &a);
    long long n;
    printf("Nhap n = ");
    scanf("%lld", &n);
    printf("Gia tri cua a^n \n");
    printf("Ham BitShiftFasPower: %lld\n", BitShiftFastPower(a, n));
    printf("Ham RecursiveFastPower: %lld\n", RecursiveFastPower(a, n));
    printf("Ham power: %lld\n", power(a, n));
}