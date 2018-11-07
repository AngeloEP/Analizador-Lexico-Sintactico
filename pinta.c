#include <stdio.h>
#include <graphics.h>


void main(){
	int gdriver=DETECT,gmode;
	initgraph(&gdriver,&gmode,"");
	setcolor(2);
	line(0,0,10,7);
	getch();
	closegraph();

	return 0;
}