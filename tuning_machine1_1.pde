int nowtape = 0, newtape = 0;
int i, j = 2;
int flag = 0;
int hourValue = 0;
String gumin = "A*#>B A#$>C A$*>C A0#>B B*$>A B#*>C B$$>A B0#>C C**>A C#$>B C$*>A C0#<B";
String[] guchick = split(gumin, " ");
String[] sym = {"#", "$", "*"};
String tape = "# # * 0 0 0 0 0 $ 0 0 0 0 * 0 0 0 0 0 0 0 0";
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
int now = 1;



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
    text(guchick[i], 1235, 170+i*80);
  }
  fill(0);
  text("MinJun's Tunning Machine, Ver 1.1", 700, 1150);
  text("Your Status: ", 200, 900);
  text(now, 600, 900);

  fill(255);
}

void newHeader(char headerDirection)
{
  if (headerDirection == '<') { 
          nx1 = nowtape*90;
          nx2 = nowtape*90+90;
          nx3 = (x1+x2)/2;
          y12 = 120;
          y3 = 80;
          newtape--;      
          LR = -1;
        } else if (headerDirection == '>') {
          nx1 = nowtape*90;
          nx2 = nowtape*90+90;
          nx3 = (x1+x2)/2;
          y12 = 120;
          y3 = 80;
          newtape++;
          LR = 1;
        }
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
    text("END", 800, 800);
    return;
  }
  if (trimove == false) {
    println("nwetape ",newtape);
    flag2 = 0;
    // this program runs only you press the mouse
    for (i=0; i<len; i++) {

      String guchickValue = "";
      st = "";
      st+=cycle[hourValue];
      st+=ntape[newtape];
      guchickValue += guchick[i].charAt(0);
      guchickValue += guchick[i].charAt(1);
      isequal = guchickValue.equals(st);
      char headerDirection = guchick[i].charAt(3);
      ndir = headerDirection;
      char newCriclenum = guchick[i].charAt(4);
      
      if (isequal&&flag2==0) {
        flag2 = 1;
        nowtape = newtape;
        now++;
        ni = i;
        statusFG(ni); 
        trimove = true;

        newHeader(headerDirection);
        
        ntape[nowtape] = "";
        ntape[nowtape]+= guchick[i].charAt(2);
        
        if (newCriclenum == 'A') hourValue = 0;
        else if (newCriclenum == 'B') hourValue = 1;
        else if (newCriclenum == 'C') hourValue = 2;
        println(headerDirection, newCriclenum, isequal);
        println(st, guchickValue);
        println(i, "times");
      }
    }
    noLoop();
  } else if (trimove==true) {
    loop();
    if (LR==1) {//right
      x1+=5; 
      x2+=5;
      x3 = (x1+x2)/2;
    } else if (LR == -1) {
      x1-=5;
      x2-=5;
      x3 = (x1+x2)/2;
    }
    if (LR==1&& x1>newtape*90-4) {
      y12-=10;
      y3-=10;
      trimove = false;
      delay(100);
    } else if (LR == -1&&x1<(newtape)*90+4) {
      y12-=10;
      y3-=10;
      trimove = false;
      delay(100);
    }
  }
}
void keyPressed() {
  redraw();
}

void mousePressed(){

  redraw();
}
