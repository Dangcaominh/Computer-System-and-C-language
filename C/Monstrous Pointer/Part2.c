#include <stdio.h>

int main()
{
    int n = 70;
    // Con trỏ trỏ đến n
    int* ptr = &n; 
    // Con trỏ của con trỏ, trỏ đến con trỏ ptr
    int** pptr = &ptr;
    printf("Address of ptr: %p\n", &ptr);
    printf("Address of pptr: %p\n", &pptr);
    printf("Address pointed to by ptr: %p\n", ptr);
    printf("Address pointed to by pptr: %p\n", pptr);
    printf("Value of n through ptr: %d\n", *ptr);
    printf("Address pointed to by ptr through pptr: %p\n", *pptr);
    printf("Value of n through pptr: %d\n", **pptr);
    // Con trỏ hằng (Pointer to const value): không thể thay đổi giá trị mà nó đang trỏ đến, nhưng có thể thay đổi địa chỉ đến vùng nhớ khác
    const int value1 = 100;
    int value2 = 200;
    int value3 = 300;
    const int value = 400;
    // int* p1 = &value; // lỗi biên dịch không thể convert const int* thành int*
    const int* p1 = &value1; //OK
    // *p1 = 300; // Error
    p1 = &value2; //OK, có thể thay đổi địa chỉ
    p1 = &value3; //Ok,  Con trỏ hằng xử lý giá trị tại địa chỉ mà nó trỏ tới là hằng khi được truy cập thông qua con trỏ, bất kể biến ban đầu được định nghĩa là hằng hay không. 
    
    // Hằng con trỏ (Const pointer): không thể thay đổi địa chỉ, nhưng có thể thay đổi giá trị mà nó đang trỏ đến
    int* const p2 = &value2; //OK
    // p2 = &value3; // Error
    *p2 = 500; //OK, có thể thay đổi giá trị

    // Hằng con trỏ hằng (Const pointer to const value) : không thể thay đổi địa chỉ hay là giá trị mà nó đang trỏ tới
    const int* const p3 = &value1; // OK
    // *p3 = 750; // Error
    // p3 = &value4; // Error

    return 0;
}