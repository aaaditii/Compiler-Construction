%{
#include <stdio.h>
%}

%%
one|ONE       printf("1");
two|TWO       printf("2");
three|THREE   printf("3");
%%
int main()
{
    yylex();
    return 0;
}

/*
flex lex.l
gcc lex.yy.c  -o numbers
./numbers
> one  ( output -> 1)
> two ( output -> 2)
(Ctrl + D)
*/
