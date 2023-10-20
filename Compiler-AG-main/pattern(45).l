%{
#include <stdio.h>
%}

%option noyywrap

%%
[0-9]+   { printf("Pattern: %s (Number)\n", yytext); }
[a-zA-Z]+ { printf("Pattern: %s (Word)\n", yytext); }
.|\n     ;  // Ignore other characters
%%

int main() {
    printf("Pattern Generator\n");
    printf("Enter a mix of numbers and words (Ctrl+D to finish):\n");

    yylex();

    return 0;
}
