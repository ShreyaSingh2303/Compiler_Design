%{
#include <stdio.h>
%}

%option noyywrap

%%
[0-9]+[ \t]*[0-9]+ {
    int rows, cols;
    sscanf(yytext, "%d %d", &rows, &cols);
    generate_star_pattern(rows, cols);
}

.|\n     ;  // Ignore other characters
%%

void generate_star_pattern(int rows, int cols) {
    int i, j;
    for (i = 0; i < rows; i++) {
        for (j = 0; j < cols; j++) {
            printf("* ");
        }
        printf("\n");
    }
    printf("Pattern generated for %d rows and %d columns.\n", rows, cols);
}

int main() {
    printf("Star Pattern Generator\n");
    printf("Enter the number of rows and columns separated by a space:\n");

    yylex();

    return 0;
}
