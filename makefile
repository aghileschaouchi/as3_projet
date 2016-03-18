
LEX=flex
YACC=bison -d -v
CC=gcc
LDLIBS=-lfl -ly
CFLAGS=-std=c99 -lm -g -pedantic -Wall -Wextra -Wshadow -Wpointer-arith -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes 
EXEC=

$(EXEC): lex.yy.o main.o $(EXEC).tab.o
	${CC} $^ ${CFLAGS} -o $@ $(LDLIBS)

lex.yy.c: $(EXEC).l $(EXEC).tab.c
	${LEX} $<

$(EXEC).tab.c: $(EXEC).y
	${YACC} $<

.PHONY: clean
clean:
	rm -f *.o core *.tab.c *.tab.h lex.yy.c calc calc.output