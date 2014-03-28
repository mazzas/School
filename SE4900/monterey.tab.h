/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUMBER = 258,
     VAR = 259,
     IDENTIFIER = 260,
     t_SCHEMA = 261,
     t_ROOT = 262,
     t_FROM = 263,
     t_IN = 264,
     t_ALL = 265,
     t_WITHIN = 266,
     t_SUCH = 267,
     t_THAT = 268,
     t_FOREACH = 269,
     t_COORDINATE = 270,
     t_SHARE = 271,
     t_ADD = 272,
     t_PRECEDES = 273,
     t_SATISFIES = 274,
     t_INCLUDE = 275,
     t_EXTENDS = 276,
     QUOTE = 277,
     OBRACE = 278,
     EBRACE = 279,
     OANGLE = 280,
     EANGLE = 281,
     OPAREN = 282,
     EPAREN = 283,
     ITER_ZERO = 284,
     ITER_ONE = 285,
     OR = 286,
     COLON = 287,
     SEMICOLON = 288,
     COMMA = 289
   };
#endif
/* Tokens.  */
#define NUMBER 258
#define VAR 259
#define IDENTIFIER 260
#define t_SCHEMA 261
#define t_ROOT 262
#define t_FROM 263
#define t_IN 264
#define t_ALL 265
#define t_WITHIN 266
#define t_SUCH 267
#define t_THAT 268
#define t_FOREACH 269
#define t_COORDINATE 270
#define t_SHARE 271
#define t_ADD 272
#define t_PRECEDES 273
#define t_SATISFIES 274
#define t_INCLUDE 275
#define t_EXTENDS 276
#define QUOTE 277
#define OBRACE 278
#define EBRACE 279
#define OANGLE 280
#define EANGLE 281
#define OPAREN 282
#define EPAREN 283
#define ITER_ZERO 284
#define ITER_ONE 285
#define OR 286
#define COLON 287
#define SEMICOLON 288
#define COMMA 289




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

