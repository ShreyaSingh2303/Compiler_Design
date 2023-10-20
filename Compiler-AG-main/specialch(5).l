%option noyywrap
%{
#include <stdio.h>
int special_char_count = 0;
%}

%%
[!@#$%^&*(),.?":;] { special_char_count++; }
.                   /* Ignore all other characters */
%%

int main() {
    yylex();
    printf("Total special characters: %d\n", special_char_count);
    return 0;
}
