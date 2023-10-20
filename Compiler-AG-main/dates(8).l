%option noyywrap
%%
\d{1,2}/\d{1,2}/\d{2,4}   printf("DATE: %s\n", yytext);
[ \t\n]                  /* ignore whitespace */
.                        printf("INVALID: %s\n", yytext);
%%
int main() {
    yylex();
}
