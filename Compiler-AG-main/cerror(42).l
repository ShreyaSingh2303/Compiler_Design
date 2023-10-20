%{
#include <stdio.h>
int line_number = 1;
%}

%option noyywrap

%%
int  |
char |
float |
double |
void |
if    |
else  |
for   |
while |
return |
main  {
    printf("Keyword '%s' should not be used as an identifier at line %d\n", yytext, line_number);
}

.|\n   {
    if (yytext[0] == '\n') {
        line_number++;
    }
}

%%

int main() {
    printf("Welcome to the C Syntax Error Checker.\n");
    printf("Enter C code (Ctrl+D to check):\n");

    yylex();
    
    printf("Syntax check completed.\n");

    return 0;
}
