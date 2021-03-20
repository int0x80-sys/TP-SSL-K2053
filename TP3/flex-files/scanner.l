%top{
#include <stdio.h>
#include "token.h"
}
%option outfile="scanner.c"
%option header-file="scanner.h"
%option nodefault
%option noinput
%option nounput

LETRA  [[:alpha:]]
DIGITO  [0-9]
LETRAODIGITO [[:alnum:]]
ESPACIO  [[:space:]]
COMENTARIO #.*$
ASIGNACION <=
OTRO  [[:^alnum:]]{-}[[:space:]#+*/(),;<=-]

%%
leer			                            return LEER;
programa		                            return PROGRAMA;
fin			                                return FIN;
codigo			                            return CODIGO;
definir			                            return DEFINIR;
escribir		                            return ESCRIBIR;
\+                                          return '+';
\-                                          return '-';
\*                                          return '*';
\/                                          return '/';
\(                                          return '(';
\)                                          return ')';
;                                           return ';';
,                                           return ',';
{COMENTARIO}
{ASIGNACION}                                return ASIGNACION;
{LETRA}{LETRAODIGITO}*                      return ID;
{DIGITO}+         	                        return CONSTANTE;
{LETRA}{LETRAODIGITO}*{OTRO}({OTRO}|{LETRAODIGITO})*  printf("Error lexico: identficador invalida: %s\n", yytext);
{DIGITO}+{LETRAODIGITO}+                    printf("Error lexico: constante invalida: %s\n", yytext);
{ESPACIO}+                 /*ignorar*/
{OTRO}+         	                        |
.                                           printf("Error lexico: cadena desconocida: %s\n", yytext);
