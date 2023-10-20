%option noyywrap
%{
#include <stdio.h>
#include <time.h>
%}

%option noyywrap

%%
"login" {
    time_t t;
    time(&t);
    printf("Employee logged in at: %s", ctime(&t));
}

"logout" {
    time_t t;
    time(&t);
    printf("Employee logged out at: %s", ctime(&t));
}

[ \t\n]+ ;  // Ignore spaces, tabs, and newlines
. ;
%%

int main() {
    printf("Welcome to the Employee Attendance System.\n");
    printf("Type 'login' when an employee logs in and 'logout' when they log out.\n");
    printf("Press Ctrl+D to exit.\n");

    yylex();

    return 0;
}
