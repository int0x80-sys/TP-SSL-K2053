/* 
Grupo: 06

Integrantes:
    Nimia Gonzales Ozuna, 148746-2.
    Hernán Solís, 165966-2.
    Matias Ezequiel Sosa, 156795-0.
    Nahuel Dolian, 157300-7.
*/

#include <stdio.h>
#include "parser.h"
#include "temp.h"

int yylexerrs = 0;

int main(void)
{
    int exit_value = yyparse();
    
    switch(exit_value)
    {
    case 0:
        printf("Compilacion terminada con exito.\n");
        break;

    case 1:
        printf("Error de compliacion.\n");
        break;

    default:
        printf("Memoria insuficiente\n");
    }

    printf("Errors sintácticos: %i - Errores léxicos: %i - Errores semanticos: %i \n", yynerrs, yylexerrs, yysemanticerrs);

    return exit_value;
}
