#include <stdio.h>

#include "scanner.h"

static int cantId;
static int cantConst;
static int cantErr;

int main(void)
{    
    TOKEN t;
  
int main(int argc, char* argv[])
{
    int estado;
    char simbolo;

    for(t = Scanner(); t != FDT; t = Scanner())
    {
        switch(t)
        {
        case ID:
            printf("Identificador\n");
            cantId ++;
            break;

        case CONST:
            printf("Constante entera\n");
            cantConst ++;
            break;

        case ERROR:
            printf("Error\n");
            cantErr ++;
            break;
        }
    }
    
    printf("----\n");
    printf("Totales:\n");
    printf("Identificadores: %d\n", cantId);
    printf("Constantes enteras: %d\n", cantConst);
    printf("Errores: %d\n", cantErr);

    return 0;
}