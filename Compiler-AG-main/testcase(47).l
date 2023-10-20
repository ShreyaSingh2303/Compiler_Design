%{
#include <stdio.h>
%}

%option noyywrap

%%
[A-Za-z_][A-Za-z_0-9]*test[A-Za-z_0-9]* {
    printf("Test Case Identifier: %s\n", yytext);
}

.|\n ;  // Ignore other characters
%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (input_file == NULL) {
        perror("Unable to open input file");
        return 1;
    }

    printf("Test Case Identifier Recognizer\n");

    yyin = input_file;  // Set input to the file

    yylex();

    fclose(input_file);

    return 0;
}
