%{
    #include <stdio.h>

    size_t linhas;
    size_t palavras;
    size_t caracteres;
    size_t inteiros;
    size_t floats;
    size_t pontuacoes;
%}

%option noyywrap

LETRA       [a-zA-ZáàâãéêíóôõúçÁÀÂÃÉÊÍÓÔÕÚÇ]
PALAVRA     {LETRA}+
DIGITO      [0-9]
INTEIRO     {DIGITO}+
FLOAT       {INTEIRO}\.{INTEIRO}
PONTUACAO   [.,;:!?]

%%

{FLOAT} {
    floats++;
    caracteres += yyleng;
}

{INTEIRO} {
    inteiros++;
    caracteres += yyleng;
}

{PALAVRA} {
    palavras++;
    caracteres += yyleng;
}

{PONTUACAO} {
    pontuacoes++;
    caracteres += yyleng;
}

\n {
    linhas++;
    caracteres += yyleng;
}

. {
    caracteres += yyleng;
}

%%

int main(int argc, char **argv)
{
    yylex();

    printf("+--------------------------+\n");
    printf("| %-12s | %10s |\n", "Metrica", "Valor");
    printf("+--------------------------+\n");
    printf("| %-12s | %10zu |\n", "Linhas", linhas);
    printf("| %-12s | %10zu |\n", "Palavras", palavras);
    printf("| %-12s | %10zu |\n", "Caracteres", caracteres);
    printf("| %-12s | %10zu |\n", "Inteiros", inteiros);
    printf("| %-12s | %10zu |\n", "Floats", floats);
    printf("| %-12s | %10zu |\n", "Pontuacoes", pontuacoes);
    printf("+--------------------------+\n");

    return 0;
}
