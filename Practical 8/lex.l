%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"
%}

%%

[0-9]+ {yylval = atoi(yytext); return NUMBER;}
[-+*/0] {return yytext[0]; }
[\t] {/* Skip Whitespace */}
\n {return '\n'; }
. {printf("%s", yytext);}

%%

int yywrap(void) {
    return 1;
}

/*
flex lex.l
bison -d parser.y

gcc parser.tab.c lex.yy.c -o calc -lfl

./calc

> 4 + 5
> 8 / 2
> 12 - 4
> 9 / 3
> 9 / 0 (should give zero division error) 

(Ctrl + D)
*/
