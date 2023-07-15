#include <stdio.h>

long  fact(long  x) {
   if (x == 0) {
      return 1;
    }
   return x * fact(x-1);
  }

int main() {
   	   long result;
               long val = 4;
               result = fact(val);
               printf("Factorial = %ld\n",result);
               return 0;
             }
