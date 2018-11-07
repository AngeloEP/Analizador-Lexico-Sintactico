all:
	g++ pinta.c -o bin/prog -lgraph
	flex flexito.l
	gcc lex.yy.c -o bin/analizador -lfl