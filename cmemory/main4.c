#include <stdio.h>
#include <stdlib.h>

int main(void) {
    char ch = 'A';
    char* ptr = &ch; // pointer gets address for ch that's A
    ptr[20] = 'B';   
    printf("%c\n", ptr[20]);
}gd

