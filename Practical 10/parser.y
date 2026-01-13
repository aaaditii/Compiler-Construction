%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    void yyerror(char *s);
    int yylex(void);
    int temp = 0;

    char* newTemp() {
        char* t = malloc(10);
        sprintf(t, "t%d", temp++);
        return t;
    }
%}

%union {
    int num;
    struct {
        char* code;
        char* temp;
    } expr_type;
}

%token <num> NUMBER;
%type <expr_type> expr

%left '+' '-'
%left '*' '/'

%%

program:
    /* empty */
    | program expr '\n'   { printf("%s\n", $2.code); }
    ;

expr: 
    NUMBER {
        char* t = newTemp();
        $$.code = malloc(50);
        $$.temp = t;
        sprintf($$.code, "%s = %d", t, $1); 

    }
    | expr '+' expr {
        char* t = newTemp();
        $$.code = malloc( strlen( $1.code ) + strlen( $3.code ) + 50 );
        $$.temp = t;
        sprintf($$.code, "%s\n%s\n%s = %s + %s", $1.code, $3.code, t, $1.temp, $3.temp);
    }
    
    | expr '-' expr {
        char* t = newTemp();
        $$.code = malloc( strlen( $1.code ) + strlen( $3.code ) + 50 );
        $$.temp = t;
        sprintf($$.code, "%s\n%s\n%s = %s - %s", $1.code, $3.code, t, $1.temp, $3.temp);
    }
    
    | expr '*' expr {
        char* t = newTemp();
        $$.code = malloc( strlen( $1.code ) + strlen( $3.code ) + 50 );
        $$.temp = t;
        sprintf($$.code, "%s\n%s\n%s = %s * %s", $1.code, $3.code, t, $1.temp, $3.temp);
    }
    
    | expr '/' expr {
        char* t = newTemp();
        $$.code = malloc( strlen( $1.code ) + strlen( $3.code ) + 50 );
        $$.temp = t;
        sprintf($$.code, "%s\n%s\n%s = %s / %s", $1.code, $3.code, t, $1.temp, $3.temp);
    }
    |'(' expr ')' { $$ = $2; }
    ;

%%

void yyerror( char* s ) {
    fprintf( stderr, "ERROR %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
