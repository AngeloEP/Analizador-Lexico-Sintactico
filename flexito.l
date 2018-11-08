/* DECLARACIONES */
%option noyywrap
%{
	#include "bisoncito.tab.h"
	#include <stdio.h>
	#include <stdlib.h>

	int ncaracteres = 0;

%}

digito [0-9]
entero {digito}+
caracter [a-zA-Z]
cadena {caracter}+
identificador [a-zA-Z][a-zA-Z0-9]*
keyword "pos"|"color"|"("|")"|"da valor "|"editar"|"termino"
opRelacional "="
opAritmetico "+"|"-"|"*"|"/"|"**"

%%

{entero} 											{yylval=atoi(yytext);return CONST;}

"editar"											{return editar;}
","													{return COMA;}
"pos"|"POS"											{return POS;}
"color"|"COLOR"										{return COLOR;}
"davalor "|"DAVALOR "								{return DAVALOR;}
"="|" = "|" ="|"= "									{return IGUAL;}
"arr"|"ARR"											{return ARRIBA;}
"aba"|"ABA"											{return ABAJO;}
"der"|"DER"											{return DERECHA;}
"izq"|"IZQ"											{return IZQUIERDA;}
"rojo"|"ROJO"										{return ROJO;}
"verde"|"VERDE"										{return VERDE;}
"azul"|"AZUL"										{return AZUL;}
"amarillo"|"AMARILLO"								{return AMARILLO;}
"blanco"|"BLANCO"									{return BLANCO;}
"("													{return A_PARENTESIS;}
")"													{return C_PARENTESIS;}
"termino"											{return termino;}
{identificador}										{return ID;}

. {printf("\n desconocido \n");}

%%

/*int main(){
	yylex();
	printf("FINALIZO EL ANALIZADOR!\n" );
}*/
