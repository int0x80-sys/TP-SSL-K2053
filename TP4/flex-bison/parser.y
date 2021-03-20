%code top{
#include <stdio.h>
#include "scanner.h"
}
%code provides{
void yyerror(const char *);
extern int yylexerrs;
}


/*Declaraciones Bison*/
%defines "parser.h"
%output "parser.c"
%left '+' '-'
%left '*' '/'
%precedence NEG
%define api.value.type {char *}
%define parse.error verbose
%token PROGRAMA CODIGO FIN DEFINIR LEER ESCRIBIR ID CONSTANTE
%token ASIGNACION "<="
 
%%
programa: PROGRAMA definiciones CODIGO sentencias FIN { if (yynerrs || yylexerrs) YYABORT;}
definiciones: definiciones definicion
	| %empty
	;
definicion: DEFINIR ID ';' {printf("definir %s\n", yylval);}
	| error ';'
	;
sentencias: sentencia
	| sentencias sentencia
	;
sentencia: LEER '('listaIdentificadores')' ';' {printf("leer\n");}
	| ESCRIBIR '('listaExpresiones')' ';' {printf("escribir\n");}
	| ID ASIGNACION expresion ';' {printf("asignacion\n");}
	| error ';'
	;
listaIdentificadores: ID
	| listaIdentificadores ',' ID
	;
listaExpresiones: expresion
	| listaExpresiones ',' expresion
	;
expresion: expresion '+' expresion {printf("suma\n");}
	| expresion '-' expresion {printf("resta\n");}
	| expresion '*' expresion {printf("multiplicacion\n");}
	| expresion '/' expresion {printf("division\n");}
	| '-' expresion %prec NEG {printf("inversion\n");}
	| '(' expresion ')' {printf("parentesis\n");}
	| CONSTANTE
	| ID
	;
%%

void yyerror(const char *s){
	printf("linea #%d: %s\n", yylineno, s);
}
