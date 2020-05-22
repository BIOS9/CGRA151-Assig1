void setup()
{
  background(255,255,255);
  size(500, 500);
  drawOnce();
}

void drawOnce()
{
  stroke(0,0,0);
  
  //Red rectangle
  fill(255,0,0);
  rect(20,20,100,50);
    
  //Green ellipse
  fill(0,255,0);
  ellipse(70,120,100,50);
  
  //Blue triangle
  fill(0,0,255);
  triangle(20,200,70,240,120,170);
  
  //Purple shape
  fill(120,0,240);
  beginShape();
  vertex(250,60);
  vertex(300,140);
  vertex(400,250);
  vertex(450,65);
  vertex(300, 33.0);
  vertex(250,60); //Match staring vertex to close shape and complete stroke
  endShape();
  
  //Gold line
  noFill();
  stroke(141,142,25);
  strokeWeight(2);
  line(250,400,270,300);
  
  //Turquoise line
  noFill();
  stroke(0,128,129);
  strokeWeight(4);
  line(300,400,320,300);
  
  //Purple line
  noFill();
  stroke(120,0,240);
  strokeWeight(8);
  line(350,400,370,300);
}

void draw()
{
  
}
