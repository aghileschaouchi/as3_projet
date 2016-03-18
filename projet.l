%{
#include "projet.tab.h"
#include <stdlib.h>
#include <stdio.h>
int fileno(FILE *stream);
%}

%option noinput nounput

%x	TEXT
%x	DIV
%x 	LIEN

COM		"""[^\"]+"""

%%

"div{"											{ECHO; printf("\n"); BEGIN DIV;}

<DIV>"""										{ECHO; printf("\n"); BEGIN TEXT;}
<DIV>"a["[[[:alpha:]]+"="COM[[:space:]]*]+"]{"COM"}"		
												{ECHO; printf("\n"); BEGIN LIEN;}
<TEXT>[^\"]+ 									{ECHO; printf("\n"); return TXT;}
<TEXT>""" 										{ECHO; printf("\n"); BEGIN DIV;}

\n 					{}

%%



