#include <stdio.h>



/*
*   @param x: This is the variable name.
*   @param (*x): This indicates that x is a pointer.
*   @param (*x)[]: This indicates that x is a pointer to an array of unspecified size.
*   @param (*(*x)[])(): This indicates that the elements of the array are pointers to functions.
*   @param int(*(*x)[])(): This indicates that the functions return an int.
*   @param int(*(*x)[])(); is a pointer to an array of pointers to functions that return an int.
*/ 
int (*(*x)[])();

int fucker()
{
    return 12;
}

int trapboy()
{
    return 42;
}

int main()
{
    // Create array with size 2 of pointers to functions that return an int. 
    int (*function[])() = {fucker, trapboy};
    // Assign x to function
    x = &function;
    // Call the function through the pointer x
    for (int i = 0; i < sizeof(function) / sizeof(int(*)()); i++)
    {
        int result = (*x)[i]();
        printf("%d\n", result);
    }
}