%{
    #include <stdio.h>
    #include "parser.tab.h"
%}

%%
[0-9]+ { yylval.num = atoi(yytext); return NUMBER; }
[-+*/()] { return yytext[0]; }
[ \t] ; /*Skip Whitespace*/
\n { return '\n'; }
. { printf("Invalid Character: %s\n", yytext); } 
%%

int yywrap(void) {
    return 1;
}

/*
flex lex.l
bison -d parser.y

gcc parser.tab.c lex.yy.c -o code_gen -lfl

./code_gen
4 + 5 * (8 / 2) - 10

(Ctrl + D)

*/
