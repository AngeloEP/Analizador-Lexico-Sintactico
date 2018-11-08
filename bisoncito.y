
%{
	#include<stdio.h>
      #include<stdlib.h>
      extern FILE *yyin;
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
	PROG: editar INST TERMINO;

	INST: INST INST 
         | ASIG_COLOR
         | ASIG_POS
         | MOVER
         | ASIG_VALOR
          ;

	TERMINO: termino  {exit(0);};

	ASIG_COLOR:
			COLOR A_PARENTESIS COLO C_PARENTESIS   { printf(" el color se cambiara"); };
	
	ASIG_VALOR: DAVALOR ID IGUAL VALOR  {printf("Se le asigna valor");}
               | DAVALOR ID IGUAL COLO	{printf(" se le asigna color"); }
                ;
	
	ASIG_POS: POS  A_PARENTESIS  VALOR COMA VALOR  C_PARENTESIS;
	
	MOVER:   DERECHA A_PARENTESIS VALOR C_PARENTESIS	{ printf(" Derecha"); }
           | IZQUIERDA A_PARENTESIS VALOR C_PARENTESIS	{ printf(" Izquierda"); }
           | ARRIBA A_PARENTESIS VALOR C_PARENTESIS		{ printf(" Arriba"); }
           | ABAJO A_PARENTESIS VALOR C_PARENTESIS		{ printf(" abajo"); }
           ;
	
	VALOR:   ID		{$$ = $1; printf("ID"); }
           | CONST	{$$ = $1; printf("Constante"); }
           ;
    
    COLO:   ROJO    { printf(" rojo"); }
          | VERDE	{ printf(" verde"); }
          | AZUL	{ printf(" azul"); }
          | AMARILLO{ printf(" amarillo"); }
          | BLANCO	{ printf(" blanco"); }
          ;

%%
main(){
      FILE *fp;
      fp = fopen("fichero.lm","r");
      if(!fp){printf("Error\n");exit(1);}
      yyin = fp;
      yyparse();
}
yyerror(char* mensaje){
	printf("\nAnalisis suspendido");
	printf("\nMensaje: %s",mensaje);
}
