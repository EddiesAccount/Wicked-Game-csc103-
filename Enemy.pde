class Enemy {
// vars
int x;
int y;
int w;
int h;

int left;
int right;
int top;
int bottom;

int speed;

boolean shouldRemove;
boolean shouldRelocate;

Enemy (int ex, int ey ,int ew, int eh) {

x = ex;
y = ey;
w = ew;
h = eh;

left = 800 - w/2;
right = 800 + w/2;
top = y - h/2;
bottom = y + h/2;

speed = 1;


}
void render () {
monkeyAnimation.display(x,y);

}

void move () {
x -= speed;
if (currentTime - startTime > interval/2) {
speed = 2;
}


}


void killPlayerG (Glinda galinda) {
  
if ( x == 0) {

state = 4;
}

}

void killPlayerE (Elphaba elphie) {
if (x == 0) {
state = 4;

}
}
}
