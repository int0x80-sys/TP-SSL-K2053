#include "symbol.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define DICTIONARY_SIZE 256
#define REGISTER_SIZE 32

static struct
{
    char regs [DICTIONARY_SIZE][REGISTER_SIZE];
    int last_reg;
} s_dictionary;

bool s_is_defined(const char* id)
{
    for(int i = 0; i < s_dictionary.last_reg; i++)
    {
        char* reg = s_dictionary.regs[i];
        if(!strncmp(reg, id, strlen(reg)))
                    return true;
    }

    return false;
}

void s_define(const char* id)
{
    if(s_dictionary.last_reg == REGISTER_SIZE)
    {
        printf("Error: Diccionario lleno...\n");
        exit(1);
    }
    strcat(s_dictionary.regs[s_dictionary.last_reg++], id);
    printf("Declare %s, Integer\n", id);
}
