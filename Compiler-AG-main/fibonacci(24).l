%option noyywrap
%{
#include <stdio.h>

int fib(int n) {
    if (n <= 0) return 0;
    if (n == 1) return 1;
    return fib(n - 1) + fib(n - 2);
}
%}

%option noyywrap

%%
[0-9]+      {
                int n = atoi(yytext);
                if (n >= 0) {
                    for (int i = 0; i <= n; i++) {
                        printf("%d ", fib(i));
                    }
                    printf("\n");
                }
            }
\n          /* newline character - do nothing */
.           /* ignore any other characters */

%%

int main() {
    yylex();
    return 0;
}
