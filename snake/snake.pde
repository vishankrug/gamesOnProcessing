ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int w = 30;
int h = 30;
int blocksize=20;
int dir = 2;
int applex = 12;
int appley=10;
int[] dx = {0,0,1,-1}, dy = {1,-1,0,0};
boolean gameover = false;
int score =0 ;

void setup()
{
  x.add(15);
  y.add(15);
  size(600,600);
}

void draw()
{
  background (255);
  fill(0);
  text(score,100,100);
  for(int i = 0; i < w; i++){ line(i*blocksize, 0, i*blocksize, height);}
  for (int i =0; i<h; i++){line(0,i*blocksize, width, i*blocksize);}
  for(int i =0; i<x.size(); i++){
    fill (0,255,0);
    rect(x.get(i)*blocksize, y.get(i)*blocksize, blocksize, blocksize); 
  }
  if(gameover==false){
  fill (255,0,0);
  rect(applex*blocksize,appley*blocksize,blocksize,blocksize);
 
  if (frameCount%5==0){
    x.add(0,x.get(0) + dx[dir]);
    y.add(0,y.get(0) + dy[dir]);
    if (x.get(0) <0 || y.get(0) <0 || x.get(0) >=w || y.get(0) >= h) gameover = true;
    
    for (int i = 1; i < x.size(); i++) if (x.get(0) == x.get(i) && y.get(0) == y.get(i)) gameover = true;
    
    if (x.get(0) == applex && y.get(0)==appley){
      applex = (int)random(0,w);
      appley=(int)random(0,h);
      score = score +1;
      if (score%5==0){
      x.add(x.size()+5);
      y.add(y.size()+5);
      }
      else{
      x.add(x.size()+1);
      y.add(y.size()+1);
      }
    }
    x.remove(x.size()-1); //will get longer otherwise
    y.remove(y.size()-1);
  }
  }
  else{
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text("GAME OVER. PRESS SPACE", width/2, height/2);
    if(keyPressed&&key==' '){
      x.clear();
      y.clear();
      x.add(10);
      y.add(15);
      gameover=false;
      score=0;
}
  
  }
}
  
  void keyPressed() // the  ? works as an if statement.
  {int newdir= key=='s' || (keyCode == DOWN) ? 0 : (key=='w' || (keyCode == UP)? 1 : (key=='d' || (keyCode== RIGHT)? 2: (key=='a' || (keyCode == LEFT) ? 3 : -1)));//why one speech mark '
  if (newdir !=-1 && (x.size()<=1 || !(x.get(1) == x.get(0) + dx[newdir] && y.get(1)==y.get(0)+dy[newdir]))) dir = newdir;

} //why one speech mark '