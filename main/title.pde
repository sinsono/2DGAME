int iji=0;

void title()
{

  if (mousePressed==true)
  {
    if (mouseY>=height/1.6528925619834 && mouseY<=height/1.4527845036319)
    {
      if (mouseX>=width/2.8235294117647 && mouseX<=width/2.0869565217391)
      {
        iji=0;
        allc=0;
      }
      if (mouseX>=width/2.0869565217391 && mouseX<=width/1.6551724137931)
      {
        iji=1;
        allc=255;
      }
      mousePressed=false;
    }
  }

  background(abs(allc-255));

  for (int i=0; i<2; i++)
  {
    if (i==iji)
      fill(200);
    else
      noFill();
    stroke(allc);
    rect(width/2.4+i*width/8, height/1.55, width/8, height/12);
  }

  fill(allc);
  textSize(width/12);
  textAlign(CENTER);
  text("2DGAME", width/2, height/2.5);
  textSize(width/30);
  text("COLOR", width/2.1, height/1.8);
  text("A", width/2.4, height/1.5);
  text("B", width/2.4+width/8, height/1.5);

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
  //circle(fx+x, fy+y, er);
  for (int i=i1; i<i2; i++)
  {
    land.add(new Land(random(width/40, width/20), random(height/20, height/6), random(width/240, width/120)));
  }
  for (int i=ii; i<iii; i++)
  {
    land.get(i).generate();
    land.get(i).move();
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
    }
  }
}
