float r1;
float r2;
float len1 = 150;
boolean spin = true;
int dir = 1;
int colr1 = (int)(Math.random()*150) + 100;
int colr2 = (int)(Math.random()*150) + 100;
int colr3 = (int)(Math.random()*150) + 100;
void setup() {
  size(800, 600);
}

void draw() {
  background(0);
  stroke(1);
  translate(width/2, height/2);
  pushMatrix();
  rotate(radians(r1));
  fractal(len1/2, 0, len1);
  fractal(0.0, len1/2, len1);
  fractal(-len1/2, 0, len1);
  fractal(0.0, -len1/2, len1);
  popMatrix();

  pushMatrix();
  rotate(radians(-r1));
  fill(#FFE967);
  star(0, 0, 30, 70, 5);
  popMatrix();
  
  noStroke();
  fill(255);
  float x = width;
  float len2 = 25;
  int number = 50;
  illusion(x, number, len2, radians(r2));

  if (spin) {
    r1 += 3 * dir;
    r2 -= 0.1;
  }

  if (len1 >= 1625) {
    len1 = 800;
    colr1 = (int)(Math.random()*150) + 100;
    colr2 = (int)(Math.random()*150) + 100;
    colr3 = (int)(Math.random()*150) + 100;
  }
}


public void fractal(float x, float y, float siz) {
  fill(colr1, colr2, colr3);
  ellipse(x, y, siz, siz);
  if (siz > 150) {
    fractal(x - siz/4, y, siz/2);
    fractal(x, y + siz/4, siz/2);
    fractal(x + siz/4, y, siz/2);
    fractal(x, y - siz/4, siz/2);
  }
}

//STAR CODE FROM PROCESSING WEBSITE NOT MY WORK
public void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

public void illusion(float x, int num, float len2, float rotate){
  if (num > 0){
   pushMatrix();
   rotate(rotate);
   ellipse(x, 0, len2, len2);
   popMatrix();
   
   illusion(x * 0.95, num - 1, len2, rotate + radians(r2));
  
  }
}

public void keyPressed()
{
  if (key=='w')
  {
    if(len1 > 100){
     len1 -= 25; 
    }
  }
  if (key=='s')
  {
    len1 += 25;
  }
  if (key == ' ') {
    if (spin) {
      spin = false;
    } else {
      spin = true;
    }
  }
  if (key == 'r') {
    dir *= -1;
  }
  if (key == 'c') {
    colr1 = (int)(Math.random()*150) + 100;
    colr2 = (int)(Math.random()*150) + 100;
    colr3 = (int)(Math.random()*150) + 100;
  }
}
