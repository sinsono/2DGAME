class Enemy{
  
  float sizex,sizey;
  float x;
  float speed;
  
  Enemy(float sizex, float sizey,float speed)
  {
    this.sizex=sizex;
    this.sizey=sizey;
    this.speed=speed;
    x=width+sizex/2;
  }
  
  void generate()
  {
    fill(0);
    rect(x,height*0.9166666-sizey/2,sizex,sizey);
  }
  
  void move()
  {
    x-=speed;
  }
}
