%{
#include <stdio.h>
%}

%option noyywrap

%%
[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ { printf("Source IP: %s\n", yytext); }
-> { printf("Arrow (Protocol Version Separator)\n"); }
[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ { printf("Destination IP: %s\n", yytext); }
: { printf("Colon (Port Separator)\n"); }
[0-9]+ { printf("Port Number: %s\n", yytext); }
, { printf("Comma (Header Field Separator)\n"); }
[A-Za-z0-9]+ { printf("Header Field: %s\n", yytext); }
[0-9]+ { printf("Data Length: %s\n", yytext); }
. { printf("Unrecognized Character: %s\n", yytext); }
%%

int main() {
    printf("Protocol Analysis\n");
    printf("Enter a protocol message:\n");

    yylex();

    return 0;
}
