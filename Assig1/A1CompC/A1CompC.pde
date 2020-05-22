//Circle parameters
static final float CIRCLE_RADIUS = 50;

void setup()
{
  size(500, 500);
}

void draw()
{
  clear();
  background(204, 204, 204); //Grey
  color fillColor = color(0,0,255);
  if(mousePressed)
    fillColor = color(255,0,0);
  fill(fillColor);
  ellipse(mouseX, mouseY, CIRCLE_RADIUS, CIRCLE_RADIUS);
}
