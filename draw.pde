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
