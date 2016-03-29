%option noyywrap

%{
#ifdef _WIN32
#define YY_NO_UNISTD_H
#include "io.h"
#endif

#include <iostream>

#include "parser.h"
#include "parser.hh"
#include "util.h"

#define YY_DECL extern "C" int yylex()
%}

 // Task 1 - add your implementation in between the '%%'s
%%
[ \t\r\n]      ; // ignore whitespaces and new lines
[0-9]+         { yylval.ival = atoi(yytext); return INT; }
0x[0-9a-fA-F]+ { yylval.ival = strtol(yytext + 2, NULL, 16); return INT; }
[a-zA-Z0-9]+   { yylval.sval = strdup(yytext); return IDENT; }
"("            { return LEFT; };
")"            { return RIGHT; };
"&"            { return CONJ; };
"|"            { return DISJ; };
","            { return COMMA; };
"!"            { return NEG; };
%%