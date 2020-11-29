float circleX;
float circleY;
float a,b,c;

void setup(){
  size(500,500);
  background (0);
}

void draw(){
  
  circleX =random (width); //between 0 & width
  circleY = random(height);
  a = random (255);
  b = random (255);
  c = random (255);
  
  //drawing
  fill(a,b,c);
  ellipse(circleX, circleY, 24, 24);
}