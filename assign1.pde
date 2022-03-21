PImage skyImg;
PImage groundImg;
PImage hogImg;
PImage heartImg;
PImage robotImg;
PImage humanImg;
  float robotLocationX;
  int robotLocationY;
  int robotX;
  int robotY;
  float soldierLocationX;
  int soldierLocationY;
  float soldierX;
  int soldierSpeedX;
  int soldierY;
  int speedX;
  int lasorX1,lasorX2;
  int lasorY;
  int edge,laserLenght;

void setup() {
  size(640, 480,P2D);

  skyImg=loadImage("img/bg.jpg");
  groundImg=loadImage("img/soil.png");
  hogImg=loadImage("img/groundhog.png");
  heartImg=loadImage("img/life.png");
  robotImg=loadImage("img/robot.png");
  humanImg=loadImage("img/soldier.png");

  
  soldierLocationY=floor(random(2,6));
  soldierY=soldierLocationY*80;
  robotLocationX=random(2,8);
  robotLocationY=floor(random(2,6));
  robotY=robotLocationY*80;
  robotX=(int)robotLocationX*80-70;
    if(soldierY==robotY){
    robotLocationY=floor(random(2,6));
    robotY=robotLocationY*80;}
 
  lasorY=robotY+37;
  lasorX1=robotX+25;
  lasorX2=robotX+25;
  edge=lasorX1-160+30;//light
}

void draw() {
  size(640, 480,P2D);
  
  skyImg=loadImage("img/bg.jpg");
  groundImg=loadImage("img/soil.png");
  hogImg=loadImage("img/groundhog.png");
  heartImg=loadImage("img/life.png");
  robotImg=loadImage("img/robot.png");
  humanImg=loadImage("img/soldier.png");
  
  /*base*/
  image(skyImg,0,0);//sky
   fill(124,204,25);
  noStroke();
  rect(0,145,640,15);//grassland
  
  fill(253,184,19);
  strokeWeight(5);
  stroke(255,255,0);
  ellipse(590,50,120,120); //sun
  
  image(groundImg,0,160);//soil
  
  image(heartImg,10,10);
  image(heartImg,10+50+20,10);
  image(heartImg,10+50+20+50+20,10);//life
  
  image(hogImg,width/2-40,80);//earthhog
  
  /*advanced*/
  //soldierLocationX=random(8);
  //soldierLocationY=floor(random(2,6));
  image(humanImg,soldierX,soldierY);
  //soldierX=soldierLocationX*80.0;
  soldierSpeedX=6;
  soldierX+=soldierSpeedX;
    if(soldierX>=width){
    image(humanImg,soldierX,soldierY);
    soldierX =-80;
    soldierSpeedX=3;
    soldierX+=soldierSpeedX;
    soldierX%=640;}//human
    
    image(robotImg,robotX,robotY);//robot
  
   /*ultimate*/
  stroke(260,0,0);
  strokeWeight(10);
  speedX=2;
   
  line(lasorX2,lasorY,(lasorX1-=speedX) -laserLenght++,lasorY);
  if(laserLenght++ > 20){
    lasorX2-=speedX;
    laserLenght=20;
  }
  if(robotX-140 >= lasorX1){
    laserLenght=0;/*let laser from short to long*/
    lasorX1=robotX+25;
    lasorX2=robotX+25;
  }
    
}
