#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char ch = 'A';
    char* ptr = &ch;   // pointer gets the address of char
    printf("%c\n", ptr[20]); //
}

