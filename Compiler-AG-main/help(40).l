%{
#include <stdio.h>
%}

%option noyywrap

%%
"help" {
    printf("Welcome to the Help Command.\n");
    printf("Available commands:\n");
    printf("1. command1 - Description of command 1.\n");
    printf("2. command2 - Description of command 2.\n");
    printf("3. command3 - Description of command 3.\n");
    printf("Type 'exit' to return to the main program.\n");
}

"exit" {
    printf("Exiting Help. Returning to the main program.\n");
}

[ \t\n]+ ;  // Ignore spaces, tabs, and newlines
. ;
%%

int main() {
    printf("Welcome to the Main Program.\n");
    printf("Type 'help' for assistance or 'exit' to quit.\n");

    while (1) {
        printf("Enter a command: ");
        yylex();
    }

    return 0;
}
