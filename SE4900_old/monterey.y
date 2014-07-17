/*
http://rohitsrealm.com/archive/2010/09/24/fun-with-flex-bison-and-friends/
Finally, for no real reason, I did a man flex and saw an option --bison-bridge, description scanner for bison pure parser. Bison pure parser? As in a reentrant one? But clearly I didn't have that; yylval was a global variable for crying out loud! So I hastily stripped out the %option bison-bridge option and voilà: it compiled. I almost wept with joy.

What was the final solution? Separate header file for the #define and no bison bridge. Simple, right? So why didn't anyone say so?!
*/

%{
#include <stdio.h>
#include <string.h>

void yyerror( const char *str ) {
  fprintf( stderr, "error: %s\n", str );
}

int yywrap() {
  return 1;
}

int main() {
  yyparse();
}
%}

%token NUMBER VAR IDENTIFIER t_SCHEMA t_ROOT t_FROM t_IN t_ALL t_WITHIN t_SUCH t_THAT t_FOREACH t_COORDINATE t_SHARE t_ADD t_PRECEDES t_SATISFIES t_INCLUDE t_EXTENDS QUOTE OBRACE EBRACE OANGLE EANGLE OPAREN EPAREN ITER_ZERO ITER_ONE OR COLON SEMICOLON COMMA

%%
commands: /* empty */
        | commands command
        ;

command:
       schema_name
       /*
       |
       root_set
       |
       share_all
       |
       activity_coordinate
       */
       ;

schema_name:
           t_SCHEMA IDENTIFIER {
              printf( "\tSchema %s declared.\n", $2 );
           }
           ;
%%

/*
root_set:
        t_ROOT IDENTIFIER COLON rootcontent {
          printf( "\tNew root declared: %s.\n, $2 );
        }
        ;

rootcontent:
           OPAREN rootstatements EPAREN
           |
           OBRACE rootstatements EBRACE
           ;

rootstatements:
              |
              rootstatements rootstatement SEMICOLON
              ;

rootstatement:
             statements
             ;

block:
     OPAREN [ITER_ZERO|ITER_ONE] statements EPAREN
     |
     OBRACE [ITER_ZERO|ITER_ONE] statements EBRACE
     ;

statements:
          | statements statement
          :

statement: IDENTIFIER | VAR | COMMA | OR | ITER_ZERO | ITER_ONE | block
%%
*/
