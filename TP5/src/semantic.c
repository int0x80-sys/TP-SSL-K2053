#include "semantic.h"
#include "symbol.h"
#include "temp.h"
#include "parser.h"
#include <stdio.h>

int yysemanticerrs = 0;

static char err_msg [126];

static const char* error_text[] =
{
    "NO declarado",
    "ya declarado"
};

static const char* op_text[] =
{
    "ADD",
    "SUB",
    "MUL",
    "DIV",
    "NEG"
};

void s_init_rtlib()
{
    printf("Load rtlib,\n");
}

void s_exit()
{
    free_temps();
    printf("Exit ,\n");
}

void s_read(const char* val)
{
    printf("Read %s, Integer\n", val);
}

void s_write(const char* val)
{
    printf("Write %s, Integer\n", val);
}

void s_store(const char* val, const char* dest)
{
    printf("Store %s, %s\n", val, dest);
}

void s_error(const char* id, s_error_type err_type)
{
    sprintf(err_msg, "Error semantico: identificador %s %s", id, error_text[err_type]);
    yyerror(err_msg);
    yysemanticerrs ++;
}

char* s_operate(const char* val1, const char* val2, s_op_type op_type)
{
    char* temp = new_temp();
    s_define(temp);
    printf("%s %s, %s, %s\n", op_text[op_type], val1, val2, temp);
    return temp;
}
