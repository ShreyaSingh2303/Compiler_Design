%{
#include <stdio.h>
%}

%option noyywrap

%%
0x[0-9a-fA-F]+ { printf("Sender Address: %s\n", yytext); }
-> { printf("Arrow (Transaction Separator)\n"); }
0x[0-9a-fA-F]+ { printf("Receiver Address: %s\n", yytext); }
, { printf("Comma (Field Separator)\n"); }
[0-9]+\.[0-9]+ { printf("Transaction Amount: %s\n", yytext); }
{{[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}}} { printf("Timestamp: %s\n", yytext); }
.|\n { printf("Unrecognized Data: %s\n", yytext); }
%%

int main() {
    printf("Transaction Record Analysis\n");
    printf("Enter a transaction record:\n");

    yylex();

    return 0;
}
