%option noyywrap
%%
[0-9]+      printf("NUMBER: %s\n", yytext);
[-+*/]      printf("OPERATOR: %s\n", yytext);
[(]         printf("LEFT_PAREN: %s\n", yytext);
[)]         printf("RIGHT_PAREN: %s\n", yytext);
[ \t\n]     /* ignore whitespace */
.           printf("INVALID: %s\n", yytext);
%%
int main() {
    yylex();
}
