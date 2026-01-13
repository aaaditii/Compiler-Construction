%{
    #include <stdio.h>              

    char convertCase(char c){               
        if (c >= 'a' && c <= 'z'){
            return c - 'a' + 'A';
        } else if (c >= 'A' && c <= 'Z'){
            return c - 'A' + 'a';
        }
        return c;
    }

%}

%%
[a-zA-z] { putchar(convertCase(yytext[0])); }
.        { putchar(yytext[0]);}
%%

int main(){
    yylex();

    putchar(66)

    return 0;
}

int yywrap(){
    return 1;
}


/*
flex lex.l
gcc lex.yy.c  -o convertCase
./convertCase
> Test Sentence

(Ctrl + D)
*/
