/* DECLARACIONES */
%{
	#include <stdio.h>
	#include <stdlib.h>

	int ncaracteres = 0;

%}

digito [0-9]
entero {digito}+
caracter [a-zA-Z]
cadena {caracter}+
identificador [a-z][a-z0-9]*
real {entero}\.{entero}
keyword "if"|"while"|"for"|"then"|"do"|"else"|"begin"|"end"
opRelacional "<"|">"|"<>"|"<="|">="|"="|"=="
opLogico "&"|"|"|"¬"|"&&"|"||"|"!"
opAritmetico "+"|"-"|"*"|"/"|"**"

%%

{digito} {printf("\n TOKEN = digito ");ECHO;ncaracteres++;}
{entero} {printf("\n TOKEN = Entero ");ECHO;}
{real} {printf("\n TOKEN = Numero Real ");ECHO;}
{keyword} {printf("\n TOKEN = keyword : ");ECHO;}
{identificador} {printf("\n TOKEN = Identificador : ");ECHO;}
{opRelacional} {printf("\n TOKEN = opRelacional : ");ECHO;}
{opLogico} {printf("\n TOKEN = opLogico : ");ECHO;}
{opAritmetico} {printf("\n TOKEN = opAritmetico : ");ECHO;}
. {printf("\n desconocido \n");}

%%

int main(){
	yylex();
	//printf("\n La cantidad de caracteres es: %d \n",ncaracteres );
	printf("FINALIZO EL ANALIZADOR!\n" );
}