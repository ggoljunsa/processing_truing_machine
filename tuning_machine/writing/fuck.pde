int nowtape = 0, prvtape= 0;
int i, j = 2;
int flag = 0;
int hourValue = 0;
String gumin = "A*#>B A$*>B B*#>A B$*>A A#*>B B#*<A A0*>B B0*<A";
String[] guchick = split(gumin, " ");
String[] sym = {"#", "$", "*"};
String tape = "# $ * 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0";
String[] ntape = split(tape, " ");
char [] cycle = {'A','B','C'};
int len = guchick.length;
boolean isequal;
String st = "";
boolean trimove = false;

void txting(){
    for(i=0; i<20; i++){//this is for automatic tape writing system
        fill(#030202);
        text(ntape[i], 90*i+20, 60);
        }
  hourhand(hourValue);
}

void statusBar(int nowTapeNUM, int prvTapeNUM){
  int LR = prvTapeNUM-nowTapeNUM;
  if(LR>0){//right
    int i;
    for(i=nowTapeNUM*90; i<=prvTapeNUM*90; i++){
        basic();
        txting();
        statusBar1(i);
        }
  }
  else{
     for(i=nowTapeNUM*90; i>=prvTapeNUM*90; i--){
        basic();
        txting();
        statusBar1(i);
        }
    }
}

void statusBar1(int prvTapeNUM){
  int x1 = prvTapeNUM*90;
  int x2 = prvTapeNUM*90+90;
  int x3 = (x1+x2)/2;
  int y12 = 120;
  int y3 = 80;
  fill(#FF9F29);
  triangle(x1, y12, x2, y12, x3, y3);
  
}

void  statusFG(int ngk){
    int x1, y1, x23, y2, y3;
    x1 = 1180;
    y1 = ngk*80+440;
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
    switch(hourValue){
      case 0: line(250, 450, 250, 300); break;
      case 1: line(250, 450, 370, 570); break;
      case 2: line(250, 450, 100, 570); break;
    }
}

void basic(){
  background(#F9FFAA);
  int i, j, k;
    for(i=0; i<1800; i+=90){//square
       fill(#CEF4FF);
       rect(i, 0, 90, 90);
    }
    fill(#D0E5EA);
    ellipse(250, 450, 350, 350);
    
    fill(255);//squarebox
    rect(190, 290, 100, 100);//squareUp
    rect(300, 475, 100, 100);//squareLeft
    rect(100, 475, 100, 100);//squareRight
    
    fill(0);//squarebox's text
    text(cycle[0], 220, 340);//squareUp
    text(cycle[1], 330, 525);//squareLeft
    text(cycle[2], 130, 525);//squareRight
    
    fill(255);
    for(i=0; i<9; i++){//for guchickpueo box 
      rect(1200, 400+i*80, 600, 80);
    } 
    
    fill(0);//for guchickpueo wiritng
  for(i=0; i<len; i++){
     text(guchick[i], 1240, 480+i*80);
  }
  
  fill(255);
}

void setup(){
    size(1800, 1200);
    textSize(60);
    basic();
   noLoop();// this program runs only you press the mouse
}

void draw(){
  basic();
  if(nowtape>=19){
     return;
    }
  if(trimove = false){
  for(i=0; i<len; i++){
       
      String issame = "";
      issame+=guchick[i].charAt(0);
      issame+=guchick[i].charAt(1);
      isequal = issame.equals(st);
      char dir = guchick[i].charAt(3);
      char cyc = guchick[i].charAt(4);
      if(isequal){
        ntape[nowtape] = "";
        ntape[nowtape]+= guchick[i].charAt(2);//
        statusFG(i);
        trimove = true;

        if(dir == '<'){ 
          prvtape--;
           // statusBar1(prvtape);
            //statusBar2(nowtape);
            nowtape--;
        }
        else if(dir == '>'){
          prvtape++;
           // statusBar1(prvtape);
           // statusBar2(nowtape);
            nowtape++;
        }

        if(cyc == 'A') hourValue = 0;
        else if(cyc == 'B') hourValue = 1;
        else if(cyc == 'C') hourValue = 2;
      println(dir, cyc, isequal);
      println(st, issame);
      println(i, "times");
      }
  
    }
  }
  else if(trimove){
    statusBar(nowtape, prvtape);
  }
    st = "";
    st+=cycle[hourValue];
    st+=ntape[nowtape];
  
    txting();

    delay(100);
}

void mousePressed(){
  redraw();
}
