%option yylineno
%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
	int line = 1;
%}

digit [0-9]
digits [digit]+
letter [a-zA-Z]
letters [letter]+
int [+-]?(0|[1-9]([0-9])*)
float ([+-]?([0-9]*\.[0-9]+|[0-9]+\.))|([+-]?[0-9]*(\.)?[0-9]*[Ee][+-]?digits)
id [a-zA-Z]([_0-9a-zA-Z])*
semi ;
comma ,
assignop =
relop >|<|<=|>=|==|!=
plus +
minus -
star *
div /
and &&
or ||
dot .
not !
type int|float
lp (
rp )
lb [
rb ]
lc {
rc }
STRUCT struct
RETURN return
IF if
ELSE else
WHILE while

%%
; {;}
, {;}
\n	{line++;}
. {printf("error type A at:%d",line);}

%% 

int main(int argc,char** argv){
	if(argc >1){
		if(!(yyin = fopen(argv[1],"r"))){
			perror(argv[1]);
			return 1;
		}
	}
	yylex();
	return 0;
}
