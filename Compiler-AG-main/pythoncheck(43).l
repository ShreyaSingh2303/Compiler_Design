%{
#include <stdio.h>
%}

%option noyywrap

%%
"if"|"elif"|"else"|"while"|"for"|"in" {
    printf("\033[1;34m%s\033[0m ", yytext);  // Highlight as blue
}

"def"|"class" {
    printf("\033[1;31m%s\033[0m ", yytext);  // Highlight as red
}

"True"|"False"|"None" {
    printf("\033[1;32m%s\033[0m ", yytext);  // Highlight as green
}

"and"|"or"|"not" {
    printf("\033[1;35m%s\033[0m ", yytext);  // Highlight as magenta
}

"=="|"!="|"<"|"<="|">"|">=" {
    printf("\033[1;33m%s\033[0m ", yytext);  // Highlight as yellow
}

[ \t\n]+ ;  // Ignore spaces, tabs, and newlines
. {
    printf("%s", yytext);
}

%%

int main() {
    printf("Welcome to the Python Syntax Highlighter.\n");
    printf("Enter Python code (Ctrl+D to check):\n");

    yylex();
    
    printf("\nSyntax highlighting completed.\n");

    return 0;
}
