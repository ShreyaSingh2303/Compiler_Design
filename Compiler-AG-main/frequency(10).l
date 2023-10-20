%option noyywrap

/* LEX code to count the frequency of the given word in a file */

/* Definition section */
/* Variable word indicates the word whose frequency is to be counted */
/* Variable count is used to store the frequency of the given word */

%{
#include <stdio.h>
#include <string.h>

char word[] = "geeks";
int count = 0;
%}

/* Rule Section */
/* Rule 1 compares the matched token with the word to count and increments the count variable on a successful match */
/* Rule 2 matches everything other than strings (consisting of alphabets only) and does nothing */

%%
[a-zA-Z]+ {
    if (strcmp(yytext, word) == 0)
        count++;
}
.;

%%

int main(int argc, char *argv[])
{
    FILE *inputFile;
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    inputFile = fopen(argv[1], "r");
    if (inputFile == NULL) {
        perror("Error opening file");
        return 1;
    }

    yyin = inputFile;
    yylex();
    fclose(inputFile);

    printf("Frequency of '%s' in the file: %d\n", word, count);

    return 0;
}
