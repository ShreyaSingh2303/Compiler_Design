%{
#include <stdio.h>
#include <stdlib.h>
%}

%token A B NL

%%

stmt: S NL {
    printf("valid string\n");
    exit(0);
};

S: A S B |
  ;

%%

int yyerror(const char *msg) {
    printf("invalid string\n");
    exit(1);
}

int main() {
    printf("enter the string\n");
    yyparse();
    return 0;
}
