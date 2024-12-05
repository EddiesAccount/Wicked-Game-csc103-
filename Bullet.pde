class Bullet {
// variables 

int x;
int y;
int d;
int speed;

boolean shouldRemove;

int left;
int right;
int top;
int bottom;
// constructor

Bullet (int bx, int by){
x = bx;
y = by;

d = 10;
speed = 10;

shouldRemove = false;

left = x - d/2;
right = x + d/2;
top = y - d/2;
bottom = y + d/2;
}

void render () {
    fill (#FF83B3);
    stroke (#FF3482);
    if (state == 2) {
      stroke (255,0,0);
    fill (200,0,0);
    }
circle (x,y,d);
}

void move () {
x += speed;

if (mouseY > height/2  /* && mouseX > width/2 */) {
y = y + 1;
}
else if (mouseY < height/2 /* && mouseX > width/2 */) {y = y - 1;}

left = x - d/2;
right = x + d/2;
top = y - d/2;
bottom = y + d/2;
}

void checkRemoved () {
if (x >= width) {
shouldRemove = true;
}

}

void shootEnemy ( Enemy anEnemy) {
if (top <= anEnemy.bottom &&
bottom >= anEnemy.top &&
left <= anEnemy.right &&
right >= anEnemy.left
) 
{
 shouldRemove = true;
anEnemy.shouldRemove = true;
anEnemy.speed = anEnemy.speed-4;
anEnemy.x = 1000;
//anEnemy.shouldRelocate = true;


}
}



}
