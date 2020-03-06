int nowtape = 0, newtape = 0;
int i, j = 2;
int flag = 0;
int hourValue = 0;
String gumin = "A*#>B A#$>C A$*>C A0#>B B*$>A B#*>C B$$>A B0#>C C**>A C#$>B C$*>A C0$<B";
String[] guchick = split(gumin, " ");
String[] sym = {"#", "$", "*"};
String tape = "# $ * 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0";
String[] ntape = split(tape, " ");
char [] cycle = {'A', 'B', 'C'};
int len = guchick.length;
boolean isequal;
String st = "";
boolean trimove = false;
int x1 = 0;
int x2 = 90;
int x3 = (x1+x2)/2;
int y12 = 120;
int y3 = 80;
int LR;
int nx1, nx2, nx3;
char ndir;
int ni;// for statusflag
int flag2 = 0;



void txting() {
  for (i=0; i<20; i++) {//this is for automatic tape writing system
    fill(#030202);
    text(ntape[i], 90*i+20, 60);
  }
  hourhand(hourValue);
}

void  statusFG(int ngk) {
  int x1, y1, x23, y2, y3;
  x1 = 1180;
  y1 = ngk*80+140;
  x23 = x1-200;
  y2 = y1-40;
  y3 = y1+40;
  // noStroke();
  fill(#F03535);
  triangle(x1, y1, x23, y2, x23, y3);
  //Stroke(1);
}

void hourhand(int hourValue)
{
  fill(0);
  switch(hourValue) {
  case 0: 
    line(250, 450, 250, 300); 
    break;
  case 1: 
    line(250, 450, 370, 570); 
    break;
  case 2: 
    line(250, 450, 100, 570); 
    break;
  }
}

void basic() {
  background(#F9FFAA);
  int i;
  for (i=0; i<1800; i+=90) {//squaretape
    fill(#CEF4FF);
    rect(i, 0, 90, 90);
  }
  fill(#D0E5EA);
  ellipse(250, 450, 350, 350);

  fill(255);//squarecyclebox
  rect(190, 290, 100, 100);//squareUp
  rect(300, 475, 100, 100);//squareLeft
  rect(100, 475, 100, 100);//squareRight

  fill(0);//squarebox's text
  text(cycle[0], 220, 340);//squareUp
  text(cycle[1], 330, 525);//squareLeft
  text(cycle[2], 130, 525);//squareRight

  fill(255);
  for (i=0; i<12; i++) {//for guchickpueo box 
    rect(1200, 100+i*80, 600, 80);
  } 

  fill(0);//for guchickpueo wiritng
  for (i=0; i<len; i++) {
    text(guchick[i], 1240, 180+i*80);
  }
  fill(0);
  text("MinJun's Tunning Machine, Ver 1.0", 700, 1150);

  fill(255);
}

void setup() {
  size(1800, 1200);
  textSize(60);
  basic();
  //noLoop();// this program runs only you press the mouse
}

void draw() {
  basic();
  fill(#FF9F29);
  triangle(x1, y12, x2, y12, x3, y3);
  txting();
  //statusFG(ni);

  if (newtape>19) {
    return;
  }
  if (trimove == false) {
    flag2 = 0;
    // this program runs only you press the mouse
    for (i=0; i<len; i++) {

      String issame = "";
      st = "";
      st+=cycle[hourValue];
      st+=ntape[newtape];
      issame+=guchick[i].charAt(0);
      issame+=guchick[i].charAt(1);
      isequal = issame.equals(st);
      char dir = guchick[i].charAt(3);
      ndir = dir;
      char cyc = guchick[i].charAt(4);
      if (isequal&&flag2==0) {
        flag2 = 1;
        nowtape = newtape;

        ni = i;
        statusFG(ni);
        trimove = true;

        if (dir == '<') { 

          nx1 = nowtape*90;
          nx2 = nowtape*90+90;
          nx3 = (x1+x2)/2;
          y12 = 120;
          y3 = 80;
          newtape--;
          LR = -1;
        } else if (dir == '>') {

          nx1 = nowtape*90;
          nx2 = nowtape*90+90;
          nx3 = (x1+x2)/2;
          y12 = 120;
          y3 = 80;
          newtape++;
          LR = 1;
        }
        ntape[nowtape] = "";
        ntape[nowtape]+= guchick[i].charAt(2);
        if (cyc == 'A') hourValue = 0;
        else if (cyc == 'B') hourValue = 1;
        else if (cyc == 'C') hourValue = 2;
        println(dir, cyc, isequal);
        println(st, issame);
        println(i, "times");
      }
    }
    noLoop();
  } else if (trimove==true) {
    loop();
    if (LR==1) {//right
      x1+=3; 
      x2+=3;
      x3 = (x1+x2)/2;
    } else if (LR == -1) {
      x1-=3; 
      x2-=3;
      x3 = (x1+x2)/2;
    }
    if (LR==1&& x1>newtape*90) {

      trimove = false;
      delay(100);
    } else if (LR == -1&&x1<(newtape)*90) {

      trimove = false;
      delay(100);
    }
  }
}
void keyPressed() {
  redraw();
}
