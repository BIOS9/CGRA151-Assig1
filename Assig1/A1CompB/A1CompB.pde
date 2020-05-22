//Triangle parameters
static final int TRIANGLE_COUNT = 500;
static final float MAX_POINT_DISTANCE_X = 50;
static final float MAX_POINT_DISTANCE_Y = 50;

void setup()
{
  size(500, 500);
  fill(255,255,255); //White fill
  drawOnce();
}

void drawOnce()
{
  for(int i = 0; i < TRIANGLE_COUNT; ++i) //Count from 0 to TRIANGLE_COUNT
  {
    //Initial point
    float xpos1 = random(0, width); //random value between 0 and width
    float ypos1 = random(0, height);//Random value between 0 and height
    
    //Second point
    float xpos2 = random(xpos1 - MAX_POINT_DISTANCE_X, xpos1 + MAX_POINT_DISTANCE_X);
    float ypos2 = random(ypos1 - MAX_POINT_DISTANCE_Y, ypos1 + MAX_POINT_DISTANCE_Y);
    
     //Third point
    float xpos3 = random(xpos1 - MAX_POINT_DISTANCE_X, xpos1 + MAX_POINT_DISTANCE_X);
    float ypos3 = random(ypos1 - MAX_POINT_DISTANCE_Y, ypos1 + MAX_POINT_DISTANCE_Y);
    
    //Draw triangle
    triangle(xpos1, ypos1, xpos2, ypos2, xpos3, ypos3);    
  }
}

void draw()
{
  
}
