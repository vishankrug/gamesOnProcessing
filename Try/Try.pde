int x, speed, speedrect, rect, rectt, recttt, rectttt, score;
boolean left, right, start;
float xaxis, xaxist, xaxistw, xaxistwo;

void setup() {
  size (600, 600);
  speed = 8;
  left = false;
  right=false;
  start=false;
  speedrect=6;
  rect=-75;
  rectt = -100;
  recttt = -125;
  rectttt = -150;
  xaxis = random(50, 550);
  xaxist = random (50, 550);
  xaxistw = random(50, 550);
  xaxistwo = random(50,550);
        score = score + 1;
}

void draw() {
  background(255);
  fill(255, 0, 0);
  ellipse(x+50, 550, 100, 100);
  fill (0);
  rect(xaxis, rect, 50, 50);
  rect(xaxist, rectt, 50, 50);
  rect (xaxistw, recttt, 50, 50);
  rect (xaxistwo, rectttt, 50, 50);
  moveCircle();
  moveRect();
  reach();
  scores();
  restrictCircle();
}

void scores() {
  fill(0);
  text(score, 100, 50);
}

void restrictCircle(){
  if (x+96 >= width){
    x= x-speed;
  }
  if (x<=0){
    x = x + speed;
  }
}

void keyPressed() {
  if (key=='d'||key=='D') {
    right=true;
  }
  if (key=='A'||key=='a') {
    left=true;
  }

  if (key == ' ') {
    start = true;
  }
}

void reach(){
  if (rect >= 650 && rectt>=650 && recttt>=650 && rectttt>=650){
    setup();
    rect = -75;
    rectt = -100;
    recttt = -125;
    rectttt = -150;
  }
}


void keyReleased() {
  if (key=='d'||key=='D') {
    right=false;
  }
  if (key=='a'||key=='A') {
    left=false;
  }
}

void moveRect() {
    rect = rect+speedrect; rectt = rectt + speedrect; recttt = recttt + speedrect;
    rectttt = rectttt + speedrect;
}
void moveCircle() {
  if (right==true) {x=x+speed;} 
  if (left==true) {x=x-speed;}}