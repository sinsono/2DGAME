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


  switch(status) {

  case usual:

    if (keyPressed && keyCode==UP)
    {
      status=jump1;
      keyPressed=false;
    }

    break;


  case jump1:

    if (keyPressed && keyCode==UP)
    {
      status=jump2;
      vy=15;
      keyPressed=false;
    }

    y-=vy;
    vy-=0.7;

    if (y>=0)
    {
      y=0;
      vy=15;
      status=usual;
    }

    break;


  case jump2:


    y-=vy;
    vy-=0.7;

    if (y>=0)
    {
      y=0;
      vy=15;
      status=usual;
    }

    break;
  }
}
