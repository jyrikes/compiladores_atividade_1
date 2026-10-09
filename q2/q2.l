%option noyywrap nodefault noinput nounput

%{
#include <stdio.h>
%}

DIGITO   [0-9]
NUMBER   {DIGITO}+
REL_OP   (<=|>=|==|!=|<|>)

%%

"+"           { puts("PLUS"); }
"-"           { puts("MINUS"); }
"*"           { puts("TIMES"); }
"/"           { puts("DIVIDE"); }
"|"           { puts("ABS"); }
"("           { puts("LPAREN"); }
")"           { puts("RPAREN"); }
"%"           { puts("MOD"); }
"^"           { puts("POWER"); }
{REL_OP}      { printf("REL_OP %s\n", yytext); }
{NUMBER}      { printf("NUMBER %s\n", yytext); }
\n            { puts("NEWLINE"); }
[ \t\r]+      { }
.             { printf("Mystery character %s\n", yytext); }

%%

int main(void)
{
    return yylex();
}
