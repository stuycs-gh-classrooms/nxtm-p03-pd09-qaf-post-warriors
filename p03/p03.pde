/** -----------------------------------------------
 
 ----------------------------------------------- */


int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 1;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.005;
float ELECTRIC_K = 1200;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 3;
int ELECTRIC = 4;
int SPRINGS = 5;
boolean[] toggles = new boolean[6];
String[] modes = {"Moving", "Bounce", "Gravity", "Drag", "Electric", "Springs"};

Orb[] orbs;
int orbCount;


void setup()
{
  size(600, 600);

  
  makeOrbs(false);
 

  println(orbs.length);
}//setup


void draw()
{
  background(255);
  displayMode();

  //draw the orbs and springs
  for (int o=0; o < orbCount; o++) {
    orbs[o].display();
    
     stroke(10);
     if(o>0) {
    drawSpring(orbs[o],orbs[o-1]);
     }

    
    //Use drawspring correctly to draw springs
  }//draw orbs & springs

  if (toggles[MOVING]) {
    if(toggles[5]) {
    applySprings();
    }
  
    if(toggles[3]) {
    for (int o=0; o < orbCount; o++) {
      orbs[o].applyForce(orbs[o].getDragForce(D_COEF));
    }
    }
    if(toggles[4]) {
      //applyElectricity();
      applyElectric();
    }
    if(toggles[2]) {
      applyGravity;
    }

    for (int o=0; o < orbCount; o++) {
      orbs[o].move(toggles[BOUNCE]);
    }
  }//moving

}//draw



 


void makeOrbs(boolean ordered)
{
   orbCount = NUM_ORBS;
   orbs = new Orb[orbCount];
   orbs[0]=new FixedOrb(0,height/2,random(MIN_SIZE,MAX_SIZE),random(MIN_MASS,MAX_MASS));
   if(ordered) {
     for(int i = 1;i<orbCount;i++) {
      orbs[i]=new Orb(SPRING_LENGTH*i,height/2,random(MIN_SIZE,MAX_SIZE),random(MIN_MASS,MAX_MASS));
     drawSpring(orbs[i],orbs[i-1]);
   }
 }
 if(!ordered) {
   for(int i = 1;i<orbCount;i++) {
     orbs[i]=new Orb();
   }
 }
 
}//makeOrbs



void drawSpring(Orb o0, Orb o1)
{
  if(dist(o0.center.x,o0.center.y,o1.center.x,o1.center.y)>SPRING_LENGTH) {
   stroke(255,0,0); 
  }
  if(dist(o0.center.x,o0.center.y,o1.center.x,o1.center.y)==SPRING_LENGTH) {
   stroke(0,0,0); 
  }
  if(dist(o0.center.x,o0.center.y,o1.center.x,o1.center.y)<SPRING_LENGTH) {
   stroke(0,255,0); 
  }
  
  line(o0.center.x,o0.center.y,o1.center.x,o1.center.y);
}//drawSpring



void applySprings()
{
  orbs[0].applyForce(orbs[0].getSpring(orbs[1],SPRING_LENGTH,SPRING_K));
  orbs[orbCount-1].applyForce(orbs[orbCount-1].getSpring(orbs[orbCount-2],SPRING_LENGTH,SPRING_K));
  for(int i = 1;i<orbCount-1;i++) {
    orbs[i].applyForce(orbs[i].getSpring(orbs[i-1],SPRING_LENGTH,SPRING_K));
    orbs[i].applyForce(orbs[i].getSpring(orbs[i+1],SPRING_LENGTH,SPRING_K));
  }
}//applySprings
/*
void applyElectricity() {
  for(int i = 0;i<orbCount;i++) {
    for(int j = 0;j<orbCount;j++) {
      if(!(i==j)) {
      orbs[i].applyForce(orbs[i].getElectric(orbs[j],ELECTRIC_K));
      }
    }
  }
}
*/
void applyElectric() {
  orbs[0].applyForce(orbs[0].getElectric(orbs[1],ELECTRIC_K));
  orbs[orbCount-1].applyForce(orbs[orbCount-1].getElectric(orbs[orbCount-2],ELECTRIC_K));
  for(int i = 1;i<orbCount-1;i++) {
    orbs[i].applyForce(orbs[i].getElectric(orbs[i-1],ELECTRIC_K));
    orbs[i].applyForce(orbs[i].getElectric(orbs[i+1],ELECTRIC_K));
  }
}

void applyGravity() {
  orbs[0].applyForce(orbs[0].getGravity(orbs[1],G_CONSTANT));
  orbs[orbCount-1].applyForce(orbs[orbCount-1.getGravity(orbs[orbCount-2],G_CONSTANT));
}
void addOrb()
{
  if(orbCount<orbs.length) {
    orbs[orbCount]=new Orb();
    orbCount++;
  }
  if(orbCount>=orbs.length) {
    Orb[] orbsNew = new Orb[orbCount+1];
    arrayCopy(orbs,orbsNew);
    orbs=orbsNew;
    orbs[orbCount]=new Orb();
    orbCount++;
  }
}//addOrb



void keyPressed()
{
  if (key == ' ') {
    toggles[MOVING]  = !toggles[MOVING];
  }
  if (key == 'g') {
    toggles[GRAVITY] = !toggles[GRAVITY];
  }
  if (key == 'b') {
    toggles[BOUNCE]  = !toggles[BOUNCE];
  }
  if (key == 'd') {
    toggles[DRAGF]   = !toggles[DRAGF];
  }
  if (key=='e') {
   toggles[ELECTRIC] = !toggles[ELECTRIC]; 
  }
  if (key=='s') {
    toggles[SPRINGS] = !toggles[SPRINGS];
  }
  if (key == '1') {
    makeOrbs(true);
  }
  if (key == '2') {
    makeOrbs(false);
  }

  if (key == '-') {
    
    if(orbCount>2) {
    orbs[orbCount-1]=null;
    orbCount--;
    }
  }//removal
  if (key == '=' || key == '+') {
   
    addOrb();
  }//addition
}//keyPressed



void displayMode()
{
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int spacing = 85;
  int x = 0;

  for (int m=0; m<toggles.length; m++) {
    //set box color
    if (toggles[m]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }

    float w = textWidth(modes[m]);
    rect(x, 0, w+5, 20);
    fill(0);
    text(modes[m], x+2, 2);
    x+= w+5;
  }
}//display
