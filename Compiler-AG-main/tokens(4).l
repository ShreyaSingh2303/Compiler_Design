%option noyywrap
%{
#include <stdio.h>
int keyword_count = 0;
%}

%%
"if"|"else"|"while" { keyword_count++; }
[a-zA-Z0-9_]+        /* Ignore other identifiers */
.                    /* Ignore all other characters */
%%

int main() {
    yylex();
    printf("Total keywords: %d\n", keyword_count);
    return 0;
}
