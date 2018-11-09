all:
	bison -d -v bisoncito.y
	flex flexito.l
	gcc bisoncito.tab.c lex.yy.c -o bin/analizador -lfl
	gcc pinta.c -o bin/prog -lgraph
