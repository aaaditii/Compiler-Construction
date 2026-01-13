%{
    #include <stdio.h>                  
    int count = 0;                      
%}  

%%
[Aa][a-zA-Z]* {count ++;}    
[a-zA-Z]+ {/*Ignore rest of the word*/}           
.|\n {/* ignore other characters */}
%%

int main(){
    yylex();
    printf("Number of words staring with `A` or `a`: %d\n", count);
    return 0;
}

int yywrap(){
    return 1;
}

/*
flex lex.l
gcc lex.yy.c  -o count
./count
 > Apple ball ant ancient doll

(Ctrl + D)
*/
