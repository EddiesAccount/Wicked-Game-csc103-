class Glinda {
// variables 

int x;
int y;

int w;
int h;

color c;

boolean isUp;
boolean isDown;

int right;

int speed;
// constructor

Glinda (int gx, int gy, int gw, int gh, int gc) {
x = gx;
y = gy;
w = gw;
h = gh;
c = gc;

isUp = false;
isDown = false;

right = x ;

speed = 9;
}
 
// functions
void render () {

glindaAnimation.display(x,y);
}

void move () {
if (isUp == true ){
y -= speed;
}

if (isDown == true) {
y += speed;
}}



}
