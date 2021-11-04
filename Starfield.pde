Particle[] particles = new Particle[800];

int adjust=0;
void setup(){
  size(500,500);
  for(int i=0; i<= particles.length-2;i++){
    particles[i]=new Particle();
  }
  particles[particles.length-1]=new Oddball();
}

void draw(){
  background(255);
  adjust+=0.01;
  for(int i=0;i<=particles.length-1;i++){
    particles[i].move();
    particles[i].show();
    particles[i].goBack();
  }
}

class Particle{
  double xPos, yPos, speed, angle, xChange, yChange, size, opacity, adjust;
  int col, num;
  boolean reappear = true;
  Particle(){
    xPos= width/2;
    yPos=height/2;
    angle = Math.random() * 2 * Math.PI;
    speed = Math.random() * 5;
    xChange = Math.cos(angle)*speed;
    yChange = Math.sin(angle)*speed;
    size=1.0;
    opacity=255;
    col=color(0,0,(int)(Math.random()*256),(int)opacity);
    adjust = 0;
    num=1;
  }
 
  void show(){
    fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256),(int)opacity);
    noStroke();
    ellipse((float)xPos,(float)yPos,(float)size,(float)size);
  }
  void move(){
    xPos +=(xChange-adjust);
    yPos +=yChange;
    size+=Math.random()*(0.03-0.01)+0.01;
    opacity-=num*Math.random()*(1.0-0.2)+0.2;
  }
  void goBack(){
    if(reappear == true){
      if (xPos<0) xPos=width/2;
      if(xPos>width) xPos=width/2;
      if(yPos>height) yPos=height/2;
      if(yPos<0) yPos=height/2;
      if(opacity<=0){
        num*=-1;
        reappear = false;
      }
    }
    if(opacity>=250)num*=-1;
  }
}

class Oddball extends Particle{
  Oddball(){
    xPos= width/2;
    yPos=height/2;
    angle = Math.random() * 2 * Math.PI;
    speed = Math.random() * 1;
    xChange = Math.cos(angle)*speed;
    yChange = Math.sin(angle)*speed;
    size=50.0;
    opacity=255;
    col=color(255,(int)opacity);
    adjust = 0;
    num=1;
  }
  void move(){
    xPos +=(xChange-(Math.random()*(0.03-0.01)+0.01));
    yPos +=yChange;
    size +=Math.random()*(0.03-0.01)+0.01;
    opacity -=Math.random()*(0.5-0.2)+0.2;
  }
}
