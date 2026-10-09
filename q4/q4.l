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

int main(int argc, char **argv)
{
    if (argc != 2) {
        puts("Erro: informe o nome do arquivo de entrada.");
        return 1;
    }

    FILE *arquivo = fopen(argv[1], "r");
    if (arquivo == NULL) {
        printf("Erro: nao foi possivel abrir o arquivo '%s'.\n", argv[1]);
        return 1;
    }

    yyin = arquivo;
    int resultado = yylex();
    fclose(arquivo);
    return resultado;
}
