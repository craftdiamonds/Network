/*
Network
Author Muqarib T. Anwar 
Date: May 8th 2021
*/

int n = 100; //Number if lines & shapes

float[] m = new float[n]; //Calculates stroke color
float[] x = new float[n]; //Calculates X Coord
float[] y = new float[n]; //Calculates Y Coord
float[] vx = new float[n]; //Alternate X Coord
float[] vy = new float[n]; //Alternate Y Coord
float[] shape = new float[n]; //Creating Shape Var
float r = 0; //Generic number value made for various purposes
Reset res; //Calling Reset Class

/* Setup */
void setup() {
  fullScreen(); 
  background(0);
  res = new Reset();  //Creating Reset Object
  noCursor();
}

/* Draw */
void draw() {
  background(0); 
  noStroke(); 
  ellipse(mouseX, mouseY, 300, 300); //Creating Mouse
  //translate(r,0); 
  //rotate(r); 

  for (int i = 0; i < n; i++) { //Caculating X & Y values for lines/shapes
    x[i] += vx[i];
    y[i] += vy[i];

    if (x[i] > width) {
      x[i]  = 0;
    }
    if (x[i]  < 0) {
      x[i]  = width;
    }

    if (y[i]  > height) {
      y[i] = 0;
    }
    if (y[i] < 0) {
      y[i] = height;
    }

    if (m[i] < 0) { //Changing color depending on m
      stroke(128, 128, 255, 80);
    } else { 
      stroke(0, 255, 255, 80);
    }
    line(x[i], y[i], mouseX, mouseY); //Draws Line
    ellipse(x[i], y[i], 30, 30); //Draws Ellipses
    //rect(x[i], y[i], 50, 50);
  }

  //r -= 1;

  fill(0); 
  strokeWeight(3); 

  for (int i = 0; i < n; i++) { //Calculating distance between objects and mouse
    float dx = mouseX - x[i];
    float dy = mouseY - y[i];

    float d = sqrt(dx*dx + dy*dy); 
    if (d < 1) d = 1; 

    float f = cos(d * 0.06) * m[i] / d*2; //Moving Objects closer to the mouse
    vx[i] = vx[i] * 0.4 - f * dx; 
    vy[i] = vy[i] * 0.2 - f * dy;
  }
}

void mousePressed() {
  res.reset(); //Calling reset Function
}

void keyPressed() {
  save("network.png"); 
}
