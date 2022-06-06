ArrayList <Land> land;
ArrayList <Sky> sky;
ArrayList<Boolean> hmovem;

int status=0;
final int title=0;
final int game=1;
final int revival=2;

int allc=0; //AllColor
int C=0;
int t=0;
int Count=0;
int count=0;
int ii=0;
int iii=1;
int i1=0;
int i2=1;
int jj=0;
int jjj=1;
int j1=0;
int j2=1;
int dis=50;
int revivalc=0;

float fx, fy;
float x, y;
float vy;
float er; //Ellipse Radius

void setup()
{
  //fullScreen();
  size(1200, 600); //w:h = 2:1
  rectMode(CENTER);
  textMode(CENTER);
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  land=new ArrayList<Land>();
  sky=new ArrayList<Sky>();
  hmovem = new ArrayList<Boolean>();
  hmovem.add(false);
  hmovem.add(false);
  x=0;
  y=0;
  vy=15;
  er= height*0.06;
  fx=width/12;
  fy=height*0.885;
}

void draw()
{
  background(abs(allc-255));

  switch(status) {

  case title:

    title();

    break;


  case game:

    Count++;
    count++;
    if (count>=dis)
    {
      if (Count>=dis*20)
      {
        j2++;
        jjj++;
      }
      i2++;
      iii++;
      count=0;
    }

    fill(allc);
    rect(width/2, height/1.02, width, height/8);
    circle(fx+x, fy+y, er);

    for (int i=i1; i<i2; i++)
    {
      land.add(new Land(random(width/40, width/20), random(height/20, height/6), random(width/240, width/120)));
    }
    for (int i=ii; i<iii; i++)
    {
      land.get(i).generate();
      land.get(i).move();
      if (fx+x+er/2>=land.get(i).x-land.get(i).sizex/2 && fx+x-er/2<=land.get(i).x+land.get(i).sizex/2 && fy+y+er/2>=height*0.9166666-land.get(i).sizey && fy+y-er/2<=height*0.9166666)
      {
        status=revival;
        //noLoop();
      }
    }

    if (Count>=dis*20)
    {
      for (int j=j1; j<j2; j++)
      {
        sky.add(new Sky(random(width/30, width/12), random(height/60, height/30), random(width/240, width/120), random(height/24, height*0.6666666666)));
      }

      for (int i=jj; i<jjj; i++)
      {
        sky.get(i).generate();
        sky.get(i).move();
        if (fx+x+er/2>=sky.get(i).x-sky.get(i).sizex/2 && fx+x-er/2<=sky.get(i).x+sky.get(i).sizex/2 && fy+y+er/2>=sky.get(i).y-sky.get(i).sizey/2 && fy+y-er/2<=sky.get(i).y+sky.get(i).sizey/2)
        {
          status=revival;
          //noLoop();
        }
      }
    }

    move();

    break;


  case revival:

    C++;

    fill(allc);

    if (C>=150)
      circle(fx+x, fy+y, er);
    else
    {
      arc(fx+x-er/2, fy+y, er, er, radians(45), radians(225));
      arc(fx+x+er/2, fy+y, er, er, radians(315), radians(495));
    }
    if (120>=C && C>=60)
    {
      t++;
      if (t>=10)
        t=0;
      else if (t>=7.5)
        y++;
      else
        if (t>=5)
          x--;
        else
          if (t>=2.5)
            y--;
          else
            x++;
    }

    break;
  }
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
