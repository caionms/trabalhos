/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_C_V1_1_TAB_H_INCLUDED
# define YY_YY_C_V1_1_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    NUM = 259,
    CONST = 260,
    RETURN = 261,
    INT = 262,
    VOID = 263,
    IF = 264,
    ELSE = 265,
    FOR = 266,
    WHILE = 267,
    PLUS = 268,
    MINUS = 269,
    MULT = 270,
    DIV = 271,
    EQUAL = 272,
    CMP = 273,
    GT = 274,
    GEQ = 275,
    LT = 276,
    LEQ = 277,
    DIFF = 278,
    COMMA = 279,
    SEMICOLON = 280,
    OP = 281,
    CP = 282,
    OK = 283,
    CK = 284,
    OB = 285,
    CB = 286,
    ERROR = 287
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 21 "c-v1.1.y"

    struct decl *decl;
    struct stmt *stmt;
    struct expr *expr;
    struct type *type;
    struct param_list *plist;
    char *name;
    int d;

#line 100 "c-v1.1.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_C_V1_1_TAB_H_INCLUDED  */
