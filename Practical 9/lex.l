%{
    #include <stdio.h>
    #include "parser.tab.h"
%}
%%
"for"   { return FOR; }
"("     { return LPARSEN; }
")"     { return RPARSEN; }
"{"     { return LBRACE; }
"}"     { return RBRACE; }
";"     { return SEMICOLON; }
"="     { return ASSIGN; }
"<"     { return LT; }
">"     { return GT; }
"+"     { return PLUS; }

[a-zA-Z][a-zA-Z0-9]* { return IDENTIFIER; }
[0-9]+ { return NUMBER; }

[ \t\n ]+   {/*Skip Whitespace*/}

.       {printf("Invalid Character: %s\n", yytext);}

%%

int yywrap(void){
    return 1;
}

/*
flex lex.l
bison -d parser.y

gcc parser.tab.c lex.yy.c -o for_loop -lfl

./for_loop
> for (i = 0; i < 5; i = i + 1) {}

(Ctrl + D)
*/
