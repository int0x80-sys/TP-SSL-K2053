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
#include "scanner.h"
extern int yynerrs;

int yylexerrs = 0;

int main(void)
{
    switch(yyparse())
    {
    case 0:
        printf("Compilacion terminada con exito.\n");
        printf("Errors sintácticos: %i - Errores léxicos: %i \n", yynerrs, yylexerrs);
        return 0;

    case 1:
        printf("Error de compliacion.\n");
        printf("Errors sintácticos: %i - Errores léxicos: %i \n", yynerrs, yylexerrs);
        return 1;

    case 2:
        printf("Memoria insuficiente\n");
        return 2;
    }
    return 0;
}

