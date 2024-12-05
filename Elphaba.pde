class Elphaba {
// variables 

int x;
int y;

int w;
int h;

color c;

boolean isUp;
boolean isDown;

int right;

int speed = 9;
// constructor

Elphaba (int ex, int ey, int ew, int eh, int ec) {
x = ex;
y = ey;
w = ew;
h = eh;
c = ec;

isUp = false;
isDown = false;

right = x ;

}
 
// functions
void render () {

elphieAnimation.display(x,y);
}

void move () {
if (isUp == true ){
y -= speed;
}

if (isDown == true) {
y += speed;
}}



}
