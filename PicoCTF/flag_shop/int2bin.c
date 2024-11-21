#include <stdio.h>
#include <stdlib.h>
#include <strings.h>


void getBin(int);

int main(int argc, char* argv[]) 
{
        if (argc != 2)
        {
                printf("Usage: %s <num>", argv[0]);
                exit(1);
        }

        getBin(atoi(argv[1]));

        return 0;
}

void getBin(int num)
{
        char bin[33];
        unsigned short index = 0;
        bin[index] = (num >> 31 & 1) + 48;

        for (int i = 1 << 30; i > 0; i >>= 1)
        {
                index++;
                num & i ? (bin[index] = '1') : (bin[index] = '0');
        }

        bin[32] = '\0';

        printf("Number: %d\n", num);
        printf("Binary: %s\n", bin);

        return;
}