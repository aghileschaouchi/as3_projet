%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
int fileno(FILE *stream);
%}


%output "projet.tab.c"

%%

