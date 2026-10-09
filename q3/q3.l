%option noyywrap nodefault noinput nounput

%{
#include <stdio.h>
%}

LETRA       [a-zA-Z_]
DIGITO      [0-9]
ID          {LETRA}({LETRA}|{DIGITO})*
NUMBER      {DIGITO}+(\.{DIGITO}+)?

%%

"if"            { puts("IF"); }
"else"          { puts("ELSE"); }
"while"         { puts("WHILE"); }
"return"        { puts("RETURN"); }
"//"[^\n]*      { }
{ID}            { printf("ID %s\n", yytext); }
{NUMBER}        { printf("NUMBER %s\n", yytext); }
[ \t\r\n]+      { }
.               { printf("SIMBOLO %s\n", yytext); }

%%

int main(void)
{
    return yylex();
}
