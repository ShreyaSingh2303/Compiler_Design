%option noyywrap
%{
#include <stdio.h>
int sentence_count = 0;
%}

%%
[^.!?]+[.!?] { sentence_count++; }
.            /* Ignore text within sentences */
%%

int main() {
    yylex();
    printf("Total sentences: %d\n", sentence_count);
    return 0;
}

