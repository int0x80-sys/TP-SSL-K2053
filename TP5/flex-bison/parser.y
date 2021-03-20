%code top{
#include <stdio.h>
#include "scanner.h"
#include "symbol.h"
#include "semantic.h"
}
%code provides{
void yyerror(const char *);
extern int yynerrs;
extern int yylexerrs;
extern int yysemanticerrs;
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
programa: PROGRAMA {s_init_rtlib();} definiciones CODIGO sentencias FIN { s_exit(); if (yynerrs || yylexerrs || yysemanticerrs) YYABORT;}
definiciones: definiciones definicion
	| %empty
	;
definicion: DEFINIR ID ';' {if(!s_is_defined($2)) s_define($2); else{s_error($2, S_ALREADY_DEFINED); YYERROR;}}
	| error ';'
	;
sentencias: sentencia
	| sentencias sentencia
	;
sentencia: LEER '('listaIdentificadores')' ';'
	| ESCRIBIR '('listaExpresiones')' ';'
	| ID ASIGNACION expresion ';' {if(s_is_defined($1)) s_store($3, $1); else{s_error($1, S_NO_DEFINED); YYERROR;} }
	| error ';'
	;
listaIdentificadores: ID {if(s_is_defined($1)) s_read($1); else{s_error($1, S_NO_DEFINED); YYERROR;}}
	| listaIdentificadores ',' ID {if(s_is_defined($3)) s_read($3); else{s_error($3, S_NO_DEFINED); YYERROR;}}
	;
listaExpresiones: expresion {s_write($1);}
	| listaExpresiones ',' expresion {s_write($3);}
	;
expresion: expresion '+' expresion {$$ = s_operate($1, $3, S_ADD);}
	| expresion '-' expresion {$$ = s_operate($1, $3, S_SUB);}
	| expresion '*' expresion {$$ = s_operate($1, $3, S_MUL);}
	| expresion '/' expresion {$$ = s_operate($1, $3, S_DIV);}
	| '-' expresion %prec NEG {$$ = s_operate($2, "", S_NEG);}
	| '(' expresion ')'	{$$ = $2;}
	| CONSTANTE {$$ = $1;}
	| ID {if(s_is_defined($1)) $$ = $1; else{s_error($1, S_NO_DEFINED); YYERROR;}}
	;
%%

void yyerror(const char *s){
	printf("linea #%d: %s\n", yylineno, s);
}
