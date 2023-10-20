%option noyywrap
%%
(https?|ftp)://[^\s/$.?#].[^\s]*              printf("URL: %s\n", yytext);
[ \t\n]                                      /* ignore whitespace */
.                                            printf("INVALID: %s\n", yytext);
%%
int main() {
    yylex();
}
