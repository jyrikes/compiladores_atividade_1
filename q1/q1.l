%option noyywrap nodefault noinput nounput

%{
#include <stdio.h>
#include <stddef.h>

static size_t linhas = 0;
static size_t palavras = 0;
static size_t caracteres = 0;
static size_t inteiros = 0;
static size_t floats = 0;
static size_t pontuacoes = 0;
%}

LETRA       [a-zA-Z]
DIGITO      [0-9]
PALAVRA     {LETRA}+
INTEIRO     {DIGITO}+
FLOAT       {DIGITO}+\.{DIGITO}+
PONTUACAO   [.,;:!?]

%%

{FLOAT}       { floats++; caracteres += yyleng; }
{INTEIRO}     { inteiros++; caracteres += yyleng; }
{PALAVRA}     { palavras++; caracteres += yyleng; }
{PONTUACAO}   { pontuacoes++; caracteres += yyleng; }
\n            { linhas++; caracteres += yyleng; }
.             { caracteres += yyleng; }

%%

int main(void)
{
    yylex();
    printf("linhas: %zu\n", linhas);
    printf("palavras: %zu\n", palavras);
    printf("caracteres: %zu\n", caracteres);
    printf("inteiros: %zu\n", inteiros);
    printf("floats: %zu\n", floats);
    printf("pontuacoes: %zu\n", pontuacoes);
    return 0;
}
