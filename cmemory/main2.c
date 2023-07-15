#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char ch = 'A';
    char* ptr = &ch; // ptr (that is a char pointer) gets address of ch -> 41
    printf("%p\n", ptr);  // print the pointer address (a number that's an address in memory in which A is stored)
}

