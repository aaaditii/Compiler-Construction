%{
    #include <stdio.h>
    int line_number = 0;
%}

%%
^.*com$ {line_number++;
        printf("Line %d ends with 'com' :%s", line_number, yytext);}
^.+$ {line_number++;}
\n {/*Ignores newlines*/}
%%

int main(){
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}

/*
flex lex.l
gcc lex.yy.c  -o findString
./findString

> string.com (press enter)
> string (press enter)
> test.com (press enter)

(Ctrl + D)
*/
