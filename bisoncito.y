
%{
	#include<stdio.h>
%}

%token ARRIBA
%token ABAJO
%token DERECHA
%token IZQUIERDA
%token ROJO
%token VERDE
%token AZUL
%token AMARILLO
%token BLANCO
%token DAVALOR
%token IGUAL
%token COLOR
%token POS
%token COMA
%token CONST
%token ID
%token A_PARENTESIS
%token C_PARENTESIS
%token termino
%token editar

%start PROG

%% 
	PROG: editar INST termino;

	INST: INST INST 
         | ASIG_COLOR
         | ASIG_POS
         | MOVER
         | ASIG_VALOR
          ;

	ASIG_COLOR: COLOR A_PARENTESIS COLO C_PARENTESIS   { printf(" el color se cambiara"); };
	
	ASIG_VALOR: DAVALOR ID IGUAL VALOR 
               | DAVALOR ID IGUAL COLO
                ;
	
	ASIG_POS: POS  A_PARENTESIS  VALOR COMA VALOR  C_PARENTESIS;
	
	MOVER:   DERECHA A_PARENTESIS VALOR C_PARENTESIS
           | IZQUIERDA A_PARENTESIS VALOR C_PARENTESIS
           | ARRIBA A_PARENTESIS VALOR C_PARENTESIS
           | ABAJO A_PARENTESIS VALOR C_PARENTESIS
           ;
	
	VALOR:   ID
           | CONST
           ;
    
    COLO:   ROJO    { printf(" rojo"); }
          | VERDE
          | AZUL
          | AMARILLO
          | BLANCO
          ;

%%
main(){
	if(yyparse()==0)
	printf("\nAnalisis concluido sin errores\n");
}
yyerror(char* mensaje){
	printf("\nAnalisis suspendido");
	printf("\nMensaje: %s",mensaje);
}