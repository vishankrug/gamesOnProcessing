void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  fill(0,255,255);
  text("Hold a key to draw." + "\n" + "Press space to reset",290,75);
  
  if (keyPressed){
stroke(0);
  line (pmouseX, pmouseY, mouseX, mouseY);
  }
  
  reset();
}




void reset(){
  if(keyPressed&&key==' '){
    background(255);
  }
  
}