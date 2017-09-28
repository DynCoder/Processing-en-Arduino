float zee = 1;
float land = 15;
float latest;
float steen;
float meeuw;

void setup()
{
  size(500,500);
}

void draw ()
{
  float rgb = random(200,255);
  
  fill(0,random(50,150),random(200,255));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  ellipse(random(zee-100,zee),random(0,500),random(25,50),random(25,50));
  
  fill(rgb,rgb,random(0,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  ellipse(random(land,land+100),random(0,500),random(25,50),random(25,50));
  
  if (zee == 1)
  {
    ++zee;
    ++land;
    latest = 1;
  }
  if (land == 500)
  {
    --zee;
    --land;
    latest = 2;
  }
  if (latest == 1)
  {
    ++zee;
    ++land;
        if (meeuw == 20)
    {
    fill(255,255,255);
    ellipse(random(zee-125,zee-475),random(0,500),25,25);
    ellipse(random(zee-25,zee-75),random(0,500),25,25);
    meeuw = 0;
    }
    ++meeuw;
  }
    if (latest == 2)
  {
    --zee;
    --land;
    if (steen == 7)
    {
    fill(random(100,200),random(100,120),100);
    ellipse(random(land+100,land+101),random(0,500),random(10,25),random(10,25));
    ellipse(random(land,land+101),random(0,500),random(10,25),random(10,25));
    steen = 0;
    }
    ++steen;
  }
}