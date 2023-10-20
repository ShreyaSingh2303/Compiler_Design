%option noyywrap

SQLKEYWORD (SELECT|FROM|WHERE|ORDER\sBY|GROUP\sBY|AND|OR)
%%
{SQLKEYWORD} { printf("SQL Keyword: %s\n", yytext); }
.           ;
