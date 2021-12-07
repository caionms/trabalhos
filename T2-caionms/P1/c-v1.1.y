/* Caio Nery Matos Santos - Bison */

%{
#include <stdlib.h>
#include <stdio.h>
extern int yyparse();
extern int yylineno;
void yyerror (char const *s) {
   fprintf (stderr, "%s: line -> %d\n", s,yylineno);
   exit(1);
 }

int yylex();
%}

%token CONST
%token RETURN
%token INT
%token VOID
%token IF
%token ELSE
%token FOR
%token WHILE

%token ID
%token NUM

%token PLUS
%token MINUS
%token MULT
%token DIV
%token EQUAL
%token CMP
%token GT
%token GEQ
%token LT
%token LEQ
%token DIFF

%token COMMA
%token SEMICOLON
%token OP
%token CP
%token OK
%token CK
%token OB
%token CB

%token ERROR

%%

program : declaration-list
        ;

declaration-list : declaration-list declaration 
                 | declaration
                 ;

declaration : var-declaration 
            | fun-declaration
            | const-declaration
            ;

declaration-attrb : type-specifier ID EQUAL NUM SEMICOLON
                  | type-specifier ID EQUAL ID SEMICOLON
                  ;

var-declaration : type-specifier ID SEMICOLON 
                | type-specifier ID OB NUM CB SEMICOLON
                ;

type-specifier : INT 
               | VOID
               ;

const-declaration : CONST type-specifier ID EQUAL NUM SEMICOLON
                  ; 

fun-declaration : type-specifier ID OP params CP compound-stmt
                ;

params : param-list 
       | VOID 
       ;

param-list : param-list COMMA param 
           | param
           ;

param : type-specifier ID 
      | type-specifier ID OB CB
      ; 

compound-stmt : OK declaration-attrb statement-list CK
              | OK local-declarations statement-list CK
              ;

local-declarations : local-declarations var-declaration 
                   | %empty
                   ;

statement-list : statement-list statement 
               | %empty
               ;

statement : expression-stmt 
          | compound-stmt 
          | selection-stmt 
          | iteration-stmt 
          | return-stmt
          ;

expression-stmt : expression SEMICOLON 
                | SEMICOLON
                ;

selection-stmt : IF OP expression CP statement 
               | IF OP expression CP statement ELSE statement
               ;

iteration-stmt : WHILE OP expression CP statement
               ;

exp-attr : ID EQUAL ID
         | ID EQUAL NUM
         | type-specifier ID EQUAL NUM
         ;

exp-for : ID relop NUM
        | ID relop ID
        ;

exp-increment : ID EQUAL ID addop NUM
              | ID EQUAL ID mulop NUM
              | ID EQUAL ID addop ID
              | ID EQUAL ID mulop ID
              ;

iteration-stmt : FOR OP exp-attr SEMICOLON exp-for SEMICOLON exp-increment CP statement 
               ;

return-stmt : RETURN SEMICOLON 
            | RETURN expression SEMICOLON
            ;

expression : var EQUAL expression 
           | simple-expression
           ;

var : ID 
    | ID OB expression CB
    ;

simple-expression : additive-expression relop additive-expression 
                  | additive-expression
                  ;

relop : EQUAL 
      | LEQ 
      | LT 
      | GT 
      | GEQ 
      | CMP 
      | DIFF
      ;

additive-expression : additive-expression addop term 
                    | term
                    ;

addop : PLUS 
      | MINUS
      ;

term : term mulop factor 
     | factor
     ;

mulop : MULT 
      | DIV
      ;

factor : OP expression CP
       | var 
       | call 
       | NUM
       ;

call : ID OP args CP
     ;

args : arg-list 
     | %empty
     ;

arg-list : arg-list COMMA expression 
         | expression
         ;

%%

int main (void) {     
      printf("Result: %d\n", yyparse());
}
