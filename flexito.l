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

{entero} 											{yylval.string=yytext;return CONST;}



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
"rojo"|"ROJO"										{yylval.string=yytext;return ROJO;}
"verde"|"VERDE"										{yylval.string=yytext;return VERDE;}
"azul"|"AZUL"										{yylval.string=yytext;return AZUL;}
"amarillo"|"AMARILLO"								{yylval.string=yytext;return AMARILLO;}
"blanco"|"BLANCO"									{yylval.string=yytext;return BLANCO;}
"("													{return A_PARENTESIS;}
")"													{return C_PARENTESIS;}
"termino"											{return termino;}
{identificador}										{yylval.string=yytext;return ID;}

. {printf("\n desconocido \n");}

%%

/*int main(){
	yylex();
	printf("FINALIZO EL ANALIZADOR!\n" );
}*/
