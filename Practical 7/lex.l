%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"
%}

%%
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
[-+*/] { return yytext[0]; }
[\t] { /* Skip Whitespace */}
\n {return '\n'; }
. { printf("%s", yytext);}
%%

int yywrap(void) {
    return 1;
}

/*
flex lex.l
bison -d parser.y

gcc parser.tab.c lex.yy.c -o calc -lfl

./calc

> 4 5 +
> 8 2 /
> 3 4 -
> 9 9 *

(Ctrl + D)
*/
