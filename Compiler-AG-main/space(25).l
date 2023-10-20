%option noyywrap
/* Lex program to take input from a file and remove multiple spaces, newline, and tabs, then write the output to a separate file */

%{
	/* Definition section */
	#include <stdio.h>
%}

%%

[ \n\t]+ { fprintf(yyout, " "); }  /* Replace multiple spaces, tabs, and newlines with a single space */
.        { fprintf(yyout, "%s", yytext); } /* Copy other characters as is */

%%

int main()
{
	/* yyin and yyout as pointers of the FILE type */
	extern FILE *yyin, *yyout;

	/* yyin points to the input file "Input.txt" and opens it in read mode */
	yyin = fopen("Input.txt", "r");

	if (yyin == NULL) {
		perror("Error opening input file");
		return 1;
	}

	/* yyout points to the output file "Output.txt" and opens it in write mode */
	yyout = fopen("Output.txt", "w");

	if (yyout == NULL) {
		perror("Error opening output file");
		fclose(yyin);  // Close the input file if opening the output file fails
		return 1;
	}

	yylex(); // Perform Lexical Analysis

	/* Close the input and output files */
	fclose(yyin);
	fclose(yyout);

	return 0;
}
