%{
#include <stdio.h>
%}

%option noyywrap

%%
"PROPOSED" { printf("Consensus Message: Proposed\n"); }
"ACCEPTED" { printf("Consensus Message: Accepted\n"); }
"REJECTED" { printf("Consensus Message: Rejected\n"); }
[0-9]+ { printf("Round Number: %s\n", yytext); }
[A-Za-z0-9]+ { printf("Validator Address: %s\n", yytext); }
.|\n { printf("Unrecognized Data: %s\n", yytext); }
%%

int main() {
    printf("Consensus Mechanism Analysis\n");
    printf("Enter a consensus message:\n");

    yylex();

    return 0;
}
