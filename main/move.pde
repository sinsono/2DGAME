int jumping=0;
final int usual=0;
final int jump1=1;
final int jump2=2;

void move()
{
  if (hmovem.get(0)==true)
  {
    x+=5;
  }
  if (hmovem.get(1)==true)
  {
    x-=5;
  }
  if (fx+x<=er/2)
  {
    x=er/2-width/12;
  }
  if (fx+x>=width-er/2)
  {
    x=width-er/2-width/12;
  }

  switch(jumping) {

  case usual:

    if (keyPressed && keyCode==UP)
    {
      jumping=jump1;
      keyPressed=false;
    }

    break;


  case jump1:

    if (keyPressed && keyCode==UP)
    {
      jumping=jump2;
      vy=15;
      keyPressed=false;
    }

    y-=vy;
    vy-=0.7;

    if (y>=0)
    {
      y=0;
      vy=15;
      jumping=usual;
    }

    break;


  case jump2:


    y-=vy;
    vy-=0.7;

    if (y>=0)
    {
      y=0;
      vy=15;
      jumping=usual;
    }

    break;
  }
}
