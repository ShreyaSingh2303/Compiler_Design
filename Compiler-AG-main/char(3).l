%option noyywrap
%{
#include <stdio.h>
int char_count = 0;
%}

%%
. { char_count++; }
%%

int main() {
    yylex();
    printf("Total characters: %d\n", char_count);
    return 0;
}
