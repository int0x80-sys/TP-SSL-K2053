/* 
Grupo: 06

Integrantes:
    Nimia Gonzales Ozuna, 148746-2.
    Hernán Solís, 165966-2.
    Matias Ezequiel Sosa, 156795-0.
    Nahuel Dolian, 157300-7.
*/

#include "scanner.h"

int main(void)
{
    TOKEN t;
    
    const char* token_name[] = 
    {
        "Identificador",
        "Constante",
        "Asignacion",
        "Programa",
        "Fin",
        "Codigo",
        "Definir",
        "Leer",
        "Escribir",
    };
    
    while((t = yylex()) != FDT)
    {
        switch(t)
        {
        case ID:
        case CONSTANTE:
            printf("Token: %s\tLexema: %s\n", token_name[t-1], yytext);
            break;

        default:
            if(t > 9)
                printf("Token: %c\n", t);
            else
                printf("Token: %s\n", token_name[t-1]);
        }
    }
    printf("Token: Fin de archivo\n");
    return 0;
}
