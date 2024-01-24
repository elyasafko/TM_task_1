#include "NumClass.h"
#include <stdio.h>
//Palindrome number
int isPalindrome(int number)
{
        int temp = number;
        int reverse = 0;
    
        while (temp > 0)
        {
            int digit = temp % 10;
            reverse = reverse * 10 + digit;
            temp /= 10;
        }
        return reverse == number;
}
// Armstrong number
int isArmstrong(int number)
{
    int numDigits = numberLength(number);
    int temp = number;
    int sum = 0;
    while (temp > 0)
    {
        int digit = temp % 10;
        sum += power(digit, numDigits);
        temp /= 10;
    }
    return sum == number;
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