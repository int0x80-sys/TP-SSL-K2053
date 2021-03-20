#ifndef SEMANTIC_H
#define SEMANTIC_H

typedef enum
{ 
    S_NO_DEFINED, 
    S_ALREADY_DEFINED 
} s_error_type;

typedef enum
{
    S_ADD,
    S_SUB,
    S_MUL,
    S_DIV,
    S_NEG
} s_op_type;

void s_init_rtlib();

void s_read(const char* val);
void s_write(const char* val);
void s_store(const char* val, const char* dest);
void s_error(const char* id, s_error_type err_type);

char* s_operate(const char* val1, const char* val2, s_op_type op_type);

void s_exit();

#endif