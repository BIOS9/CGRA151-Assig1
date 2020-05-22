//Globals
float gravity = 1;
float speedDivisor = 1000;
float damping = 0.001;

//First pendulum
float length1 = 100;
float mass1 = 10;
float angle1 = PI/2;
float velocity1 = 0;
float accel1 = 0;
float x1 = 0;
float y1 = 0;

//Second pendulum
float length2 = 40;
float mass2 = 10;
float angle2 = 0;
float velocity2 = 0;
float accel2 = 0;
float x2 = 0;
float y2 = 0;

//Frame time
int frameTime = 0; //Time taken for a frame.
int lastMillis = 0; //Time of last frame.
int currentMillis = 0; //Time of current frame.

//Background
PGraphics backgroundG;
float lastX = 0;
float lastY = 0;
float hue = 0;

void setup()
{ 
  size(500,500);
  backgroundG = createGraphics(width, height);
  backgroundG.beginDraw();
  backgroundG.background(0);
  backgroundG.endDraw();
  lastMillis = millis();
}

void draw()
{  
  //Calculate frame time so that movement values can be the same at any framerate or system speed
  currentMillis = millis();
  frameTime = currentMillis - lastMillis;
  lastMillis = currentMillis;
  
  image(backgroundG, 0, 0);
  translate(width/2, height/2); //Make origin centre of the screen
  strokeWeight(3);
  stroke(255);
  
   //First pendulum
  x1 = sin(angle1) * length1; //Trigonometry to find horizontal offset
  y1 = cos(angle1) * length1; //Trigonometry to find vertical offset
  line(0, 0, x1, y1); //Draw main line of pendulum
  ellipse(x1, y1, mass1, mass1); //Draw pendulum mass
  
  //Second pendulum
  x2 = (sin(angle2) * length2) + x1; //Trigonometry to find horizontal offset. Offset by the position of the mass on the first pendulum
  y2 = (cos(angle2) * length2) + y1; //Trigonometry to find vertical offset Offset by the position of the mass on the first pendulum
  line(x1, y1, x2, y2); //Draw main line of pendulum
  ellipse(x2, y2, mass1, mass1); //Draw pendulum mass
  
  calcAccel1(); //Calculate acceleration of first pendulum
  calcAccel2(); //Calculate acceleration of second pendulum
  
  //Acceleration
  velocity1 += accel1 * frameTime / speedDivisor;
  velocity2 += accel2 * frameTime / speedDivisor;
  
  //Slowly remove energy from the system, similar to friction
  velocity1 *= 1 - damping;
  velocity2 *= 1 - damping;
  
  //Velocity
  angle1 += velocity1 * frameTime;
  angle2 += velocity2 * frameTime;
  
  if(frameCount > 1)
  {
    backgroundG.beginDraw();
    backgroundG.translate(width/2, height/2);
    backgroundG.colorMode(HSB, 100);
    hue++;
    backgroundG.stroke(hue % 100, 100, 100);
    backgroundG.strokeWeight(1);
    backgroundG.line(lastX, lastY, x2, y2);
    backgroundG.endDraw();
  }
  
  lastX = x2;
  lastY = y2;
  
  if(mousePressed) //If mouse pressed, point the first pendulum towards the cursor
  {
    velocity1 = 0;
    velocity2 = 0;
    
    accel2 = 0;
    accel2 = 0;
    angle1 = atan2(mouseX - (width/2), mouseY - (height/2));
  }
}

//Source for kinematic equations for the double pendulum: https://www.myphysicslab.com/pendulum/double-pendulum-en.html

void calcAccel1()
{
  float numer = (-gravity * ((2 * mass1) + mass2) * sin(angle1)) - (mass2 * gravity * sin(angle1 - (2 * angle2))) - (2 * sin(angle1 - angle2) * mass2 * ((velocity2 * length2) + (velocity1 * length1 * cos(angle1 - angle2))));
  float denom = length2 * ((2 * mass1) + mass2 - (mass2 * cos((2 * angle1) - (2 * angle2))));
  accel1 = numer / denom;
}

void calcAccel2()
{
  float numer = (2 * sin(angle1 - angle2) * ((velocity1 * length1 * (mass1 + mass2)) + (gravity * (mass1 + mass2) * cos(angle1)) + (velocity2 * length2 * mass2 * cos(angle1 - angle2))));
  float denom = length2 * ((2 * mass1) + mass2 - (mass1 * cos((2 * angle1) - (2 * angle2))));
  accel2 = numer / denom;
}
