
void hourhand(int hourValue, int newX, int newY)
{
  switch(hourValue) {
  case 1: 
    line(250, 450, 250, 300); 
    break;
  case 2: 
    line(250, 450, 370, 570); 
    break;
  case 3: 
    line(250, 450, 100, 570); 
    break;
  }
}
void setup()
{
  size(100, 100);
  // strokeWeight(6);
}

void draw()
{
  background(204);

  int i;
  float angle = PI/18;



  stroke(0, 120);
  translate(50, 50);
  rotate(angle);
  line(0, 0, 40, 0);
}

void keyPressed()
{
  
}

/*
void draw()
 {
 background(204);
 float x1 = map(mouseX, 0, width, 0, 20);
 float x2 = map(mouseX, 0, width, -20, 80);
 float x3 = map(mouseX, 0, width, 20, 60);
 ellipse(x1, 25, 40, 40);
 ellipse(x2, 25, 40, 40);
 ellipse(x3, 25, 40, 40);
 }*/
