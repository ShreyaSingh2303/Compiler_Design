/*
This LEX program to check for dirty word
*/

%option noyywrap
%{
	int count = 0;
%}

alpha [a-zA-Z]
digit [0-9]
space [\t\n]
start ^dirty
%%

{start} { count++; }
{space}(a|A)({alpha}|{digit})* { count++; }
. ;
%%

int main()
{
    printf("Enter the word\n");
	yylex();
	printf("count = %d\n", count);

    return 0;
}
