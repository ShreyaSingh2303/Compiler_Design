%{
#include <stdio.h>
#include <stdlib.h>
%}

%option noyywrap

%%
"block" {
    printf("Block created.\n");
}

"transaction" {
    printf("Transaction recorded.\n");
}

[ \t\n]+ ;  // Ignore spaces, tabs, and newlines
. ;
%%

int main() {
    printf("Welcome to the Simplified Blockchain.\n");
    printf("Type 'block' to create a new block or 'transaction' to record a transaction.\n");

    while (1) {
        printf("Enter a command: ");
        yylex();
    }

    return 0;
}
