class Wand {
int wandx ;
int wandy ;
int wandx2;
int wandy2;

boolean isUp;
boolean isDown;


int speed;

Wand (int wandX, int wandY, int wandX2, int wandY2) {

wandx = wandX;
wandy = wandY;
wandx2 = wandX2;
wandy2 = wandY2;

isUp = false;
isDown = false;

speed = 9;

}

void render () {
  strokeWeight (4); 
  stroke (#FF3482);
line (wandx,wandy, wandx2,wandy2);
}

void move () {
if (isUp == true ){
wandy -= speed;
wandy2 -= speed;
}

if (isDown == true) {
wandy += speed;
wandy2 += speed;
}}












}
