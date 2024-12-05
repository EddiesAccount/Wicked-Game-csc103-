// Wicked Game!!
/*Artwork: 
main title background background & character seleccion background: wicked movie gallery https://www.wickedmovie.com/gallery/
game "emerald city" background: https://perchance.org/ai-pixel-art-generator

Music:
No One Mourns The Wicked - wicked movie cast (from the original motion picture "WICKED", lyrics by Stephen Schwarts)
Popular - Ariana Grande(from the original motion picture "WICKED", lyrics by Stephen Schwarts)
Defying Gravity - Cynthia Erivo (from the original motion picture "WICKED", lyrics by Stephen Schwarts)

*/


//declare vars <3
import processing.sound.*; 

SoundFile wandSound;
SoundFile titleMusic;
SoundFile popular;
SoundFile defyingGravity;

Glinda glinda;
Elphaba elphie;
Bullet b1;
Wand wand;

Enemy e1;
Enemy e2;
Enemy e3;
Enemy e4;
Enemy e5;
Enemy e6;
Enemy e7;
Enemy e8;
Enemy e9;
Enemy e10;
Enemy e11;
Enemy e12;


Animation glindaAnimation;
Animation elphieAnimation;
Animation monkeyAnimation;
Animation backAnimation;

int startTime ;
int currentTime;
int interval = 110000;

int state = 0;
int logoW ;
int logoH ;
int speed = 2;
int cSize = 300;

int Eleft = 250 - cSize/2 ;
int Eright = 250 + cSize/2 ;
int Etop = height/2 - cSize;
int Ebottom = height/2 + cSize;

int Gleft = 750 - cSize/2 ;
int Gright = 750 + cSize/2 ;
int Gtop = height/2 - cSize;
int Gbottom = height/2 + cSize;


PImage []glindaImages = new PImage [7];
PImage []elphieImages = new PImage [8];
PImage []monkeyImages = new PImage [5];
PImage []backImages = new PImage [32];


ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;

boolean wandDown;

PImage glBack;
PImage elBack;
PImage wickedLogo;
PImage elphCharacter;
PImage glinCharacter;
PImage wickedMain;


void setup () {
size (1000,600);
rectMode (CENTER);
imageMode (CENTER);
textAlign (CENTER);

startTime = millis ();

logoW = 450;
logoH = 225;

// initlialize varsss <3
glinda = new Glinda (130, height/2, 50, 80, color (#FF83B3));
elphie = new Elphaba (130, height/2, 50, 80, color (#FF83B3));
b1 = new Bullet (100, height/2);
wand = new Wand (160, height/2, 170, height/2 -30);

// enemies
e1 = new Enemy (800, 200, 80,130);
e2 = new Enemy (1200, 400, 80,130);
e3 = new Enemy (600, 400, 80,130);
e4 = new Enemy (1100, int(random(110,550)), 80,130);
e5 = new Enemy (1320, int(random(110,550)), 80,130);
e6 = new Enemy (1300, int(random(110,550)), 80,130);
e7 = new Enemy (1500, int(random(100,500)), 80,130);
e8 = new Enemy (1900, int(random(100,500)), 80,130);
e9 = new Enemy (1700, int(random(100,500)), 80,130);
e10 = new Enemy (2100, int(random(100,500)), 80,130);
e11 = new Enemy (2320, int(random(100,500)), 80,130);
e12 = new Enemy (2400, int(random(100,500)), 80,130);



// loading images <3
wickedLogo = loadImage ("wickedlogo.png");
elBack = loadImage ("e back.png");
glBack = loadImage ("g back.png");
elphCharacter = loadImage ("characters0.png");
glinCharacter= loadImage ("characters1.png");;
wickedMain = loadImage ("wicked main.png");

// resizing <3
wickedLogo.resize (logoW,logoH);
elBack.resize (300,300);
glBack.resize (300,300);
elphCharacter.resize (cSize, cSize);
glinCharacter.resize (cSize,cSize);
wickedMain.resize (1200, 800);

// arraylists
bulletList = new ArrayList<Bullet>();
enemyList = new ArrayList<Enemy>();

enemyList.add(e1);
enemyList.add(e2);
enemyList.add(e3);
enemyList.add(e4);
enemyList.add(e5);
enemyList.add(e6);
enemyList.add(e7);
enemyList.add(e8);
enemyList.add(e9);
enemyList.add(e10);
enemyList.add(e11);
enemyList.add(e12);


wandSound = new SoundFile (this, "wand_fx.wav");
titleMusic = new SoundFile (this, "no one mourns.mp3");
popular = new SoundFile (this, "popular.wav");
defyingGravity = new SoundFile (this, "defying_gravity.wav");
// for loops
///////////////////

for (int index = 0; index < glindaImages.length; index++){
glindaImages[index] = loadImage ("galinda"+index+".png");

}
glindaAnimation = new Animation (glindaImages, 0.1 ,3.2);

///////////////////

for (int index = 0; index < elphieImages.length; index++){
elphieImages[index] = loadImage ("elphie"+index+".png");

}
elphieAnimation = new Animation (elphieImages, 0.2 ,2.5);

//////////////////

for (int index = 0; index < monkeyImages.length; index++){
monkeyImages[index] = loadImage ("flying monkey"+index+".png");
}
monkeyAnimation = new Animation (monkeyImages, 0.05 ,3);

///////////////////

for (int index = 0; index < backImages.length; index++){
backImages[index] = loadImage ("emeral city background-"+index+".png");

}
backAnimation = new Animation (backImages, 0.03 ,1.5);

///////////////////



}

void draw () {
currentTime = millis ();
  switch (state){
  case 0:
if (titleMusic.isPlaying() == false ){
titleMusic.play();}
  image (wickedMain, width/2 - 40, height/2);

  image (wickedLogo, width/2, height/2);
     logoW = logoW - speed;
  logoH = logoH - speed;
  textSize (30);
  fill (90);
  text ("press spacebar to start", width/2, 420);
 
  
  break;
  case 1:
  background (0);
  image (elBack, 250, height/2);
  image (glBack, 750, height/2);
  
  image (elphCharacter, 250, height/2);
  image (glinCharacter, 750, height/2);
  textSize (50);
  fill (255);
  text ("choose your character!", width/2, 100);
 textSize (30);
  fill (#FF276B);
  text ("Glinda",750, height/2 + 200);
    fill (#79CE2C);
  text ("Elphaba",250, height/2 + 200);
  
  break;
  case 2:
if( titleMusic.isPlaying() ==true) {titleMusic.pause();}
if (defyingGravity.isPlaying() == false ){
defyingGravity.play();}
 backAnimation.display( width/2, height/2);
 
 elphie.render();
 elphie.move();

 wand.move();
 
   e1.move();
   e2.move();
   e3.move();
   e4.move();
   e5.move();
   e6.move();
   e7.move();
   e8.move();
   e9.move();
   e10.move();
   e11.move();
   e12.move();

elphieAnimation.isAnimating = true;
monkeyAnimation.isAnimating = true;
backAnimation.isAnimating = true;
e1.killPlayerE (elphie);
e2.killPlayerE (elphie);
e3.killPlayerE (elphie);
e4.killPlayerE (elphie);
e5.killPlayerE (elphie);
e6.killPlayerE (elphie);
e7.killPlayerE (elphie);
e8.killPlayerE (elphie);
e9.killPlayerE (elphie);
e10.killPlayerE (elphie);
e11.killPlayerE (elphie);
e12.killPlayerE (elphie);
 // for loop but better

   for (Enemy anEnemy : enemyList) {
 anEnemy.render ();

 }
 
//
 for (Bullet aBullet : bulletList) {
 aBullet.render ();
 aBullet.move ();
 aBullet.checkRemoved ();
 
 for (Enemy anEnemy : enemyList) {
 aBullet.shootEnemy(anEnemy);

 }
 }
 
 
 // for loops removes unwanted bullet
 for (int i = bulletList.size ()-1; i >= 0; i=i - 1) {
   Bullet aBullet = bulletList.get(i);
   
  if (aBullet.shouldRemove == true) {
 bulletList.remove (aBullet); 
 }
}


// kills enemies 
 for (int i = enemyList.size ()-1; i >= 0; i=i - 1) {
   Enemy anEnemy = enemyList.get(i);
   
  if (anEnemy.shouldRemove == true) {
 enemyList.remove (anEnemy); 
 }
}



if (enemyList.size() < 4){

  e5 = new Enemy (1320, int(random(50,550)), 80,130);
e6 = new Enemy (1300, int(random(50,550)), 80,130);
e7 = new Enemy (1000, int(random(50,550)), 80,130);
e8 = new Enemy (1200, int(random(50,550)), 80,130);
  e9 = new Enemy (1700, int(random(100,500)), 80,130);
e10 = new Enemy (2100, int(random(100,500)), 80,130);
e11 = new Enemy (2320, int(random(100,500)), 80,130);



enemyList.add(e5);
enemyList.add(e6);
enemyList.add(e7);
enemyList.add(e8);
enemyList.add(e9);
enemyList.add(e10);
enemyList.add(e11);


e5.render();
   e6.render();
   e7.render();
   e8.render();
      e9.render();
   e10.render();
   e11.render();



   e5.move();
   e6.move();
   e7.move();
   e8.move();
      e9.move();
   e10.move();
   e11.move();


}

if (currentTime - startTime > interval) {
  state = 5;}

break;
case 3:
if( titleMusic.isPlaying() ==true) {titleMusic.pause();}
if (popular.isPlaying() == false ){
popular.play();}
backAnimation.display( width/2, height/2);

 glinda.render();
 glinda.move();
 wand.render ();
 wand.move();
   e1.move();
   e2.move();
   e3.move();
   e4.move();
   e5.move();
   e6.move();
    e7.move();
   e8.move();
   e9.move();
   e10.move();
   e11.move();
   e12.move();

glindaAnimation.isAnimating = true;
monkeyAnimation.isAnimating = true;
backAnimation.isAnimating = true;
e1.killPlayerG (glinda);
e2.killPlayerG (glinda);
e3.killPlayerG (glinda);
e4.killPlayerG (glinda);
e5.killPlayerG (glinda);
e6.killPlayerG (glinda);
e7.killPlayerG (glinda);
e8.killPlayerG (glinda);
e9.killPlayerG (glinda);
e10.killPlayerG (glinda);
e11.killPlayerG (glinda);
e12.killPlayerG (glinda);
 // for loop but better

   for (Enemy anEnemy : enemyList) {
 anEnemy.render ();

 
 }
 
//
 for (Bullet aBullet : bulletList) {
 aBullet.render ();
 aBullet.move ();
 aBullet.checkRemoved ();
 
 for (Enemy anEnemy : enemyList) {
 aBullet.shootEnemy(anEnemy);
 }
 }
 
 
 // for loops removes unwanted bullet
 for (int i = bulletList.size ()-1; i >= 0; i=i - 1) {
   Bullet aBullet = bulletList.get(i);
   
  if (aBullet.shouldRemove == true) {
 bulletList.remove (aBullet); 
 }
}


// kills enemies 
 for (int i = enemyList.size ()-1; i >= 0; i=i - 1) {
   Enemy anEnemy = enemyList.get(i);
   
  if (anEnemy.shouldRemove == true) {
 enemyList.remove (anEnemy); 
 }
}

if (enemyList.size() < 4){

  e5 = new Enemy (1320, int(random(50,550)), 80,130);
e6 = new Enemy (1300, int(random(50,550)), 80,130);
e7 = new Enemy (1000, int(random(50,550)), 80,130);
e8 = new Enemy (1200, int(random(50,550)), 80,130);
  e9 = new Enemy (1700, int(random(100,500)), 80,130);
e10 = new Enemy (2100, int(random(100,500)), 80,130);
e11 = new Enemy (2320, int(random(100,500)), 80,130);



enemyList.add(e5);
enemyList.add(e6);
enemyList.add(e7);
enemyList.add(e8);
enemyList.add(e9);
enemyList.add(e10);
enemyList.add(e11);


e5.render();
   e6.render();
   e7.render();
   e8.render();
      e9.render();
   e10.render();
   e11.render();



   e5.move();
   e6.move();
   e7.move();
   e8.move();
      e9.move();
   e10.move();
   e11.move();


}

if (currentTime - startTime > interval) {
  state = 5;}
break;
case 4:
fill (200,0,0);
text ("oh no!", width/2, height/2 - 50);
text ("you have been captured :(", width/2, height/2);
break;
case 5 :

fill (#FF276B);
textSize (50);
stroke (255);
strokeWeight (5);
text ("you win! hurray!", width/2, height/2);
break;


}
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////



void keyPressed () {
if (key == 'w') {
glinda.isUp = true;
}
if (key == 's') {
glinda.isDown = true;
}

if (key == 'w') {
wand.isUp = true;
}
if (key == 's') {
wand.isDown = true;
}


if (key == 'w') {
elphie.isUp = true;
}
if (key == 's') {
elphie.isDown = true;
}


}


void keyReleased () {
if (key == 'w') {
glinda.isUp = false;
}
if (key == 's') {
glinda.isDown = false;
}

if (key == 'w') {
wand.isUp = false;
}
if (key == 's') {
wand.isDown = false;
}

if (key == 'w') {
elphie.isUp = false;
}
if (key == 's') {
elphie.isDown = false;
}

if (key == ' ' && state == 0){
state = 1;

}




}


void mousePressed () {

if(state == 2 || state == 3){  
  wandSound.play ();}
  
 bulletList.add (new Bullet (wand.wandx2 + 20, wand.wandy2 + 20));
  
  
  wandDown = false;
if (mousePressed == true) {
wandDown = true;
wand.wandy2 = wand.wandy2 + 20;
wand.wandx2 = wand.wandx2 + 20;
}

if (state ==1 && Etop <= mouseY &&
Ebottom >= mouseY &&
Eleft <= mouseX &&
Eright >= mouseX
){
state = 2;
}

if (state ==1 && Gtop <= mouseY &&
Gbottom >= mouseY &&
Gleft <= mouseX &&
Gright >= mouseX
){
state = 3;
}


}

void mouseReleased () {

wandDown = false;
wand.wandy2 = wand.wandy2 - 20;
wand.wandx2 = wand.wandx2 - 20;
}
