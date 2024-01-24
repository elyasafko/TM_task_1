#include "NumClass.h"
#include <stdio.h>

// Function declarations
int reverse(int number, int temp);
int getSumofDigits(int x, int p);
int getDigitsCount(int x);

//Palindrome number
int isPalindrome(int number)
{
    int temp = reverse(number, 0);
    return temp == number;
}

int reverse(int number, int temp)
{
    if (number == 0)
        return temp;
    temp = (temp * 10) + (number % 10);
    return reverse(number / 10, temp);
}

int isArmstrong(int x) 
{
    return ((x == getSumofDigits(x, numberLength(x))) ? 1:0);
}
int getSumofDigits(int x, int p) 
{
    if (x == 0)
        return 0;
    return  power((x%10), p) + getSumofDigits((x/10), p);
}
// Helper functions
// Returns the number of digits in a number
int numberLength(int number)
{
    int length = 0;
    while (number > 0)
    {
        length++;
        number /= 10;
    }
    return length;
}
// Returns the result of base^exponent
int power(int base, int exponent)
{
    int result = 1;
    for (int i = 0; i < exponent; i++)
        result *= base;
    return result;
}