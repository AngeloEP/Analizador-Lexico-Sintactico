#include <stdio.h>
#include <graphics.h>


int main(){
	int gdriver=DETECT,gmode;
	initgraph(&gdriver,&gmode,"");

	setcolor(2);
	line(0,0,100,70);
	getch();
	void wait_for_char()
	{

    //Wait for a key press
    int in = 0;

		while (in == 0) {
			in = getchar();
		}
	}
	closegraph();

	return 0;
}