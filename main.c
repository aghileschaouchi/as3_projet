#include <stdio.h>

int yyparse(void);

int main(void)
{
	fflush(stdout);
	yyparse();
	return 0;
}