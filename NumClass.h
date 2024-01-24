
/* will return if a number is Armstrong number
An Armstrong number is an n-digit number that is equal to the sum of the nth power of its digits.
For Example: 407 = 4^3 + 0^3 + 7^3 = 64 + 0 + 343 = 407
*/
int isArmstrong(int);

/* will return if a number is a palindrome*/
int isPalindrome(int);

/* will return if a number is prime */
int isPrime(int);

/* Strong number is a special number whose sum of the factorial of digits is equal to the original number.
for example: 145 is strong number
1! + 4! + 5! = 145
*/
int isStrong(int);


// Function helper declarations
int numberLength(int number);
int power(int base, int exponent);