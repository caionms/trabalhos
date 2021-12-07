/* Caio Nery Matos Santos - Flex */

%option noyywrap nodefault yylineno
%{ 
#include "c-v1.1.tab.h"
%}

%%

"//".*			{ /* no action */ }

const			{ return CONST; }
return			{ return RETURN; } 
int			{ return INT; }
void			{ return VOID; }
if 			{ return IF; }
else			{ return ELSE; }
for			{ return FOR; }
while			{ return WHILE; }

[a-zA-Z][a-zA-Z0-9_]* { yylval.name = strdup(yytext); return ID; }
[0-9]+                { yylval.d = atoi(yytext); return NUM; }

"+"			{ return PLUS; }    
"-"			{ return MINUS; }  
"*"			{ return MULT; }      
"/"			{ return DIV; } 
"="			{ return EQUAL; }  
"=="			{ return CMP; } 
">"			{ return GT; }  
">="			{ return GEQ; } 
"<"			{ return LT; } 
"<="			{ return LEQ; } 
"!="			{ return DIFF; }  
","			{ return COMMA; }        
";"			{ return SEMICOLON; }  
"("			{ return OP; }    
")"			{ return CP; }    
"{"			{ return OK; }    
"}"			{ return CK; }    
"["			{ return OB; }    
"]"			{ return CB; }  

[ \n\t\r]+		{ /* no action */}
.			{return ERROR;}

%%


