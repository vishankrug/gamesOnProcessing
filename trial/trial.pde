
int headx = 300;
int mouth1 = 290;
int mouth2= 310;
int eyeL = 280;
int eyeR = 320;
int body = 275;
int legR =325;
int speed = 5;
int jet = 40;
int jetspeed=40;
int lap = 0;
int jetpack = 293;


void setup(){
size(600,600);
background (255);
fill (0);
}


void draw(){
background (255);
laps();
fill(255);
ellipse(mouseX,mouseY,100,100);
line(mouseX-10,mouseY+30,mouseX+10,mouseY+30);
line(mouseX-25,mouseY+170,mouseX-25,mouseY+200);
line(mouseX+25,mouseY+170,mouseX+25,mouseY+200);

fill(200,0,0);
rect(mouseX,mouseY+7.5,5,5);

fill(255,165,0);
rect(mouseX-7,mouseY+170,15,jet);

fill(255,0,0);
rect(mouseX-25,mouseY+50,50,120);


fill(0);
ellipse(mouseX-20,mouseY-10,15,40);
ellipse(mouseX+20,mouseY-10,15,40);

fill (255);
/*headx=headx+speed;
mouth1=mouth1+speed;
mouth2=mouth2+speed;
eyeL = eyeL+speed;
eyeR = eyeR+speed;
body = body+speed;
legR=legR+speed;
jetpack = jetpack+speed;*/
jet = jet+jetspeed;

reachend();
}

void reachend(){
  if (headx+50>width){
    speed = -speed;
    lap++;
  }
  
  if (headx-50<0){
    speed=-speed;
    lap++;
  }
  
  if (jet>400){
    jetspeed=-jetspeed;
  }
  
  if (jet<0){
    jetspeed=-jetspeed;
  }
  
}

void laps(){
  fill(0);
  text("Laps: " + lap,300,150);
}