%{
#include <stdio.h>
%}

%option noyywrap

%%
[0-9]{4}-[0-9]{2}-[0-9]{2} { /* Date in yyyy-MM-dd format */
    printf("Date: %s\n", yytext);
}

. { /* Anything else, including log messages */
    printf("Log Message: %s\n", yytext);
}
%%

int main() {
    printf("Log File Analysis\n");
    printf("Enter log entries (Ctrl+D to finish):\n");

    yylex();

    return 0;
}
