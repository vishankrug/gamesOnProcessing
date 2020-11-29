int x, y, w, h, speedx, speedy;
int paddlexl, paddleyl, paddlew, paddleh, paddles;
int paddlexr, paddleyr;
boolean upl, downl;
boolean upr, downr;

int scoreL, scoreR;
int winScore=10;
void setup() {
  size(500, 500);
  x=width/2;
  y=height/2;
  w=50;
  h=50;
  speedx=3;
  speedy=3;
  textSize(30);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  paddlexl=20;
  paddleyl=height/2;

  paddlexr=width-20;
  paddleyr=height/2;

  paddlew=30;
  paddleh=100;
  paddles=5;
}

void draw() {
  drawCircle();
  moveCircle();
  bounceOff();

  drawPaddles();
  movePaddle();
  restrictPaddle();
  bounceOffPaddle();
  scores();
  gameOver();
}

void gameOver() {
  if (scoreL == winScore) {
    gameOverPage("Green Wins!", color(0, 255, 0));
  }

  if (scoreR == winScore) {
    gameOverPage("Yellow Wins!", color(255, 255, 0));
  }
}

void gameOverPage(String text, color c) {
  speedx =0;
  speedy=0;

  fill(255);
  text("Game Over", width/2, height/3-40);
  fill(c);
  text(text, width/2, height/3);
  fill(255);
  text("Click to play again", width/2, height/3+40);

  if (mousePressed) {
    scoreR=0;
    scoreL=0;
    speedx=3;
    speedy=3;
  }
}

void scores() {
  fill(255, 255, 255);
  text(scoreL, 100, 50);
  text(scoreR, width - 100, 50);
}

void bounceOffPaddle() {
  if (x-w/2<paddlexl+paddlew/2  && y-h/2<paddleyl +paddleh/2 &&  y-h/2>paddleyl -paddleh/2) {
    if (speedx<0) {
      speedx=-speedx;
    }
  } else if (x+w/2>paddlexr-paddlew/2  && y-h/2<paddleyr +paddleh/2 &&  y-h/2>paddleyr -paddleh/2) {
    if (speedx>0) {
      speedx=-speedx;
    }
  }
}

void restrictPaddle() {
  if (paddleyl - paddleh/2 <0) {
    paddleyl=paddleyl+paddles;
  }

  if (paddleyl + paddleh/2 > height) {
    paddleyl=paddleyl-paddles;
  }

  if (paddleyr - paddleh/2 <0) {
    paddleyr=paddleyr+paddles;
  }

  if (paddleyr + paddleh/2 > height) {
    paddleyr=paddleyr-paddles;
  }
}


void movePaddle() {
  if (upl==true) {
    paddleyl = paddleyl-paddles;
  }
  if (downl==true) {
    paddleyl=paddleyl+paddles;
  }

  if (upr==true) {
    paddleyr = paddleyr-paddles;
  }
  if (downr==true) {
    paddleyr=paddleyr+paddles;
  }
}

void keyPressed() {
  if (key=='w'||key=='W') {
    upl=true;
  }
  if (key=='s'||key=='S') {
    downl=true;
  }

  if (keyCode == UP) {
    upr=true;
  }
  if (keyCode == DOWN) {
    downr=true;
  }
}

void keyReleased() {
  if (key=='w'||key=='W') {
    upl=false;
  }
  if (key=='s'||key=='S') {
    downl=false;
  }

  if (keyCode==UP) {
    upr=false;
  }
  if (keyCode==DOWN) {
    downr=false;
  }
}

void drawPaddles() {
  fill(0, 255, 0);
  rect(paddlexl, paddleyl, paddlew, paddleh); //could also be mouseY 

  fill(255, 255, 0);
  rect(paddlexr, paddleyr, paddlew, paddleh);
}

void drawCircle() {
  background(0); //order matters
  fill (255, 0, 0);
  ellipse(x, y, w, h);// or width/2,height/2,50,50
}

void moveCircle() {
  x=x+speedx;
  y=y+speedy;
}

void bounceOff() {
  if ( x>width-25)
  {
    setup();
    speedx = -speedx;
    scoreL=scoreL+1;
  } else if (x < 0 +25)
  {
    speedx = -speedx;
    setup();
    scoreR=scoreR+1;
  }

  if (y>height-25) {
    speedy = -speedy;
  } else if (y<0+h/2) {
    speedy=-speedy;
  }
}