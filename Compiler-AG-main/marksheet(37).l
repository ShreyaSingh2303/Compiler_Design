%option noyywrap
%{
#include <stdio.h>
%}

%%
[a-zA-Z]+ { printf("Subject: %s\n", yytext); }
[0-9]+ {
    int score = atoi(yytext);
    printf("Score: %d\n", score);
    if (score >= 90) printf("Grade: A\n");
    else if (score >= 80) printf("Grade: B\n");
    else if (score >= 70) printf("Grade: C\n");
    else if (score >= 60) printf("Grade: D\n");
    else printf("Grade: F\n");
}

"finished" {
    printf("Program finished.\n");
    yyterminate(); // Terminate the Lex program
}

[ \t\n]+ ;  // Ignore spaces, tabs, and newlines
. ;
%%

int main() {
    printf("Enter subject names, scores, and type 'finished' to exit:\n");
    yylex();
    return 0;
}
