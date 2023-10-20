%option noyywrap
%%
[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}   printf("EMAIL: %s\n", yytext);
[ \t\n]                                            /* ignore whitespace */
.                                                  printf("INVALID: %s\n", yytext);
%%
int main() {
    yylex();
}
