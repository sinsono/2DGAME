ArrayList <Enemy> enemy;
ArrayList<Boolean> hmovem;

int status=0;
final int usual=0;
final int jump1=1;
final int jump2=2;

int count=0;
int ii=0;
int iii=1;
int i1=0;
int i2=1;
int dis=50;

float fx, fy;
float x, y;
float vy;

PImage run1, run2, run3, run4, run5;

void setup()
{/* if (count<=5)
 image(run1, 100, 500, 50, 60);
 else
 if (count<=10)
 image(run2, 100, 500, 33, 60);
 else
 if (count<=15)
 image(run3, 100, 500, 27, 60);
 else
 if (count<=20)
 image(run4, 100, 500, 27, 60);
 else
 if (count<=25)
 image(run5, 100, 500, 50, 60);
 
 if (25<count)
 count=0;
 */
  //fullScreen();
  size(1200, 600);
  imageMode(CENTER);
  rectMode(CENTER);
  enemy=new ArrayList<Enemy>();
  hmovem = new ArrayList<Boolean>();
  hmovem.add(false);
  hmovem.add(false);
  fx=width/12;
  fy=height*0.895;
  x=0;
  y=0;
  vy=15;
  run1 = loadImage("run1.jpg");
  run2 = loadImage("run2.jpg");
  run3 = loadImage("run3.jpg");
  run4 = loadImage("run4.jpg");
  run5 = loadImage("run5.jpg");
}

void draw()
{
  count++;
  if (count>=dis)
  {
    i2++;
    iii++;
    count=0;
  }

  background(255);
  fill(0);
  rect(width/2, height/1.02, width, height/8);
  circle(fx+x, fy+y, height*0.04166666);

  for (int i=i1; i<i2; i++)
  {
    enemy.add(new Enemy(random(30, 60), random(30, 100), random(5, 10)));
  }

  for (int i=ii; i<iii; i++)
  {
    enemy.get(i).generate();
    enemy.get(i).move();
    if (fx+x+(height*0.04166666)/2>=enemy.get(i).x-enemy.get(i).sizex/2 && fx+x-(height*0.04166666)/2<=enemy.get(i).x+enemy.get(i).sizex/2 && fy+y+(height*0.04166666)/2>=height*0.9166666-enemy.get(i).sizey && fy+y-(height*0.04166666)/2<=height*0.9166666)
    {
      noLoop();
    }
  }

  move();

  /*
  image(run1, 100+100, 500, 50, 60);
   image(run2, 100+200, 500, 33, 60);
   image(run3, 100+300, 500, 27, 60);
   image(run4, 100+400, 500, 27, 60);
   image(run5, 100+500, 500, 50, 60);
   
   if (15<count)
   count=0;
   
   if (count<=3)
   image(run1, 100, 500, 50, 60);
   else
   if (count<=6)
   image(run2, 100, 500, 33, 60);
   else
   if (count<=9)
   image(run3, 100, 500, 27, 60);
   else
   if (count<=12)
   image(run4, 100, 500, 27, 60);
   else
   if (count<=15)
   image(run5, 100, 500, 50, 60);
   */
}

void keyPressed()
{
  if (key==CODED)
  {
    switch(keyCode) {

    case RIGHT:
      hmovem.set(0, true);
      break;

    case LEFT:
      hmovem.set(1, true);
      break;
    }
  }
}

void keyReleased()
{
  if (key==CODED)
  {
    switch(keyCode) {

    case RIGHT:
      hmovem.set(0, false);
      break;

    case LEFT:
      hmovem.set(1, false);
      break;
    }
  }
}
