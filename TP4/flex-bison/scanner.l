%top{
#include <stdio.h>
#include "parser.h"
char msg [126];
}
%option outfile="scanner.c"
%option header-file="scanner.h"
%option yylineno
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
{LETRA}{LETRAODIGITO}*                      {yylval = yytext; return ID;}
{DIGITO}+         	                        {yylval = yytext; return CONSTANTE;};
{LETRA}{LETRAODIGITO}*{OTRO}({OTRO}|{LETRAODIGITO})*    {
                                                            yylexerrs++;
                                                            sprintf(msg, "Error lexico: identficador invalida: %s", yytext);
                                                            yyerror(msg);
                                                        }
{DIGITO}+{LETRAODIGITO}+    {
                                yylexerrs++;
                                sprintf(msg, "Error lexico: constante invalida: %s", yytext);
                                yyerror(msg);
                            }
{ESPACIO}+                 /*ignorar*/
{OTRO}+ |
.           {
                yylexerrs++;
                sprintf(msg, "Error lexico: cadena desconocida: %s", yytext);
                yyerror(msg);
            }
