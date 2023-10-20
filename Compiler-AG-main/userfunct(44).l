%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%x USER_FUNCTION FUNCTION_NAME FUNCTION_PARAMETERS

%%
"create" {
    printf("Creating a new user function.\n");
    BEGIN(USER_FUNCTION);
}

<USER_FUNCTION>"function" {
    printf("User function name: ");
    BEGIN(FUNCTION_NAME);
}

<FUNCTION_NAME>[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Function name: %s\n", yytext);
    BEGIN(USER_FUNCTION);
}

<FUNCTION_NAME>\( {
    printf("Function parameters: ");
    BEGIN(FUNCTION_PARAMETERS);
}

<FUNCTION_PARAMETERS>[a-zA-Z_][a-zA-Z0-9_,\s]* {
    printf("Function parameters: %s\n", yytext);
    BEGIN(USER_FUNCTION);
}

<FUNCTION_PARAMETERS>\) {
    printf("Function created successfully.\n");
    BEGIN(USER_FUNCTION);
}

.|\n {
    printf("%s", yytext);
}

<USER_FUNCTION><<EOF>> {
    printf("Exiting the program.\n");
    exit(0);
}

%%

int main() {
    printf("Welcome to the User Function Creator.\n");
    printf("Type 'create function' to start creating a user function.\n");
    printf("Enter 'EOF' on a new line to exit.\n");

    yylex();

    return 0;
}
