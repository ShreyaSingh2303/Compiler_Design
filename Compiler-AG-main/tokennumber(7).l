%option noyywrap
%%
[0-9]+      printf("INTEGER: %s\n", yytext);
[ \t\n]     /* ignore whitespace */
.           printf("INVALID: %s\n", yytext);
%%
int main() {
    yylex();
}
