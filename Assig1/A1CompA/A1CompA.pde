//Block parameters
static final float BLOCK_HEIGHT = 20;
static final float MIN_BLOCK_WIDTH = 10;
static final float MAX_BLOCK_WIDTH = 30;

//Spacing parameters
static final float MIN_SPACE_WIDTH = 5;
static final float MAX_SPACE_WIDTH = 15;

void setup()
{
  size(500, 500);
  fill(255,255,255); //White fill
  drawOnce();
}

void drawOnce()
{
  for(int i = 0; i < (height / BLOCK_HEIGHT) + 1; ++i) //Iterate over rows in window
  {
    float totalRowWidth = 0;
    while(totalRowWidth <= width) //While the current row is smaller than the window width
    {
      float blockWidth = random(MIN_BLOCK_WIDTH, MAX_BLOCK_WIDTH); //Get the random block width
      rect(totalRowWidth, i * BLOCK_HEIGHT, blockWidth, BLOCK_HEIGHT);
      totalRowWidth += blockWidth; //Add the block width to the total width;
      float spaceWidth = random(MIN_SPACE_WIDTH, MAX_SPACE_WIDTH); //Get the random space width
      totalRowWidth += spaceWidth; //Add the space width to the total width;
    }
  }
}

void draw()
{
  
}
