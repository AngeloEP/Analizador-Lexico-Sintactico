
%{
	#include<stdio.h>
      #include<stdlib.h>
      extern FILE *yyin;
%}

%union{
      int tipo_entero;
      char* string;
}

%token ARRIBA
%token ABAJO
%token DERECHA
%token IZQUIERDA
%token < string >ROJO
%token < string >VERDE
%token < string >AZUL
%token < string >AMARILLO
%token < string >BLANCO

%token DAVALOR
%token IGUAL
%token COLOR
%token POS
%token COMA
%token < string > CONST
%token < string > ID
%token A_PARENTESIS
%token C_PARENTESIS
%token termino
%token editar

%type <tipo_entero> VALOR
%type <string> COLO
%type <string> VARIABLE
%type <string> IDENTIFICADOR

%start PROG
%% 
	PROG: editar {printf("EDITAR");} INST TERMINO;

	INST: INST INST 
         | ASIG_COLOR 
         | ASIG_POS
         | MOVER
         | ASIG_VALOR
         ;

	TERMINO: termino  {printf("TERMINO");exit(0);};

	ASIG_COLOR: COLOR {printf("COLOR");} A_PARENTESIS {printf("(");} COLO C_PARENTESIS {printf(")");}
			;
	
	ASIG_VALOR: DAVALOR {printf("DAVALOR ");} IDENTIFICADOR IGUAL {printf(" = ");} VARIABLE
                ;
                
    VARIABLE: VALOR {$$ = $1;}
    		  |COLO {$$ = $1;}
    		  ;
   	IDENTIFICADOR: ID {$$=$1; printf("ID:%s",$$);};
                
	ASIG_POS: POS{printf("POS");}  A_PARENTESIS{printf("(");}  VALOR COMA {printf(",");} VALOR  C_PARENTESIS {printf(")");}
	
	MOVER:   DERECHA {printf("DERECHA");} A_PARENTESIS {printf("(");} VALOR C_PARENTESIS {printf(")");}	
           | IZQUIERDA {printf("IZQUIERDA");} A_PARENTESIS {printf("(");} VALOR C_PARENTESIS {printf(")");}	
           | ARRIBA {printf("ARRIBA");} A_PARENTESIS {printf("(");} VALOR C_PARENTESIS {printf(")");}
           | ABAJO { printf("ABAJO"); } A_PARENTESIS {printf("(");} VALOR C_PARENTESIS	{printf(")");}
           ;
	
	VALOR:   ID		{$$ = $1; printf("ID:%s",$$); }
           | CONST	{$$ = $1; printf("CONSTANTE:%s",$$); }
           ;
    
    COLO:   ROJO    {$$ = $1; printf("COLOR:%s",$$); }
          | VERDE	{$$ = $1; printf("COLOR:%s",$$); }
          | AZUL	{$$ = $1; printf("COLOR:%s",$$); }
          | AMARILLO{$$ = $1; printf("COLOR:%s",$$); }
          | BLANCO	{$$ = $1; printf("COLOR:%s",$$); }
          | ID 		{$$ = $1; printf("ID:%s",$$); }
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
