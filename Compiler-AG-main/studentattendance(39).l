%option noyywrap
%{
#include <stdio.h>
%}

%option noyywrap

%%
"present" {
    printf("Student is present.\n");
}

"absent" {
    printf("Student is absent.\n");
}

[ \t\n]+ ;  // Ignore spaces, tabs, and newlines
. ;
%%

int main() {
    printf("Welcome to the Student Attendance System.\n");
    printf("Type 'present' for a present student or 'absent' for an absent student.\n");
    printf("Press Ctrl+D to exit.\n");

    yylex();

    return 0;
}
