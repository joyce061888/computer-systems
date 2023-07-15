#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char ch = 'A';
    char* ptr = &ch;  // a char pointer gets the address of ch --> 41 (asc)
    printf("%c\n", *ptr); // prints the value of ch that ptr points to
}

