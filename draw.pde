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
void txting() {
  for (i=0; i<20; i++) {//this is for automatic tape writing system
    fill(#030202);
    text(ntape[i], 90*i+20, 60);
  }
  hourhand(hourValue);
}
void hourhand(int hourValue)
{
  fill(0);
  strokeWeight(6);
  switch(hourValue) {
  case 0: 
    line(250, 450, 250, 300);
    strokeWeight(1);
    break;
  case 1: 
    line(250, 450, 370, 570);
    strokeWeight(1);
    break;
  case 2: 
    line(250, 450, 100, 570);
    strokeWeight(1);
    break;
  }
}
void basic() {
  background(#EAE1BD);
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
  text("MinJun's Tunning Machine, Ver 1.2", 700, 1150);
  text("Your Status: ", 200, 900);
  text(nowStatus, 600, 900);

  fill(255);
}
