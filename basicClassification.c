#include "NumClass.h"
#include <stdio.h>
int isPrime(int number) 
{
    if (number < 1) 
        return 0;
    for (int i = 2; i * i <= number; i++) 
        if (number % i == 0) 
            return 0;
    return 1;
}

int isStrong(int number) 
{
    int sum = 0;
    int temp = number;

    while (temp > 0) 
    {
        int digit = temp % 10;
        int fact = 1;

        for (int i = 1; i <= digit; i++) 
            fact *= i;
        sum += fact;
        temp /= 10;
    }
    return sum == number;
}