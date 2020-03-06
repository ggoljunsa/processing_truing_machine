void newHeader(char headerDirection)
{
  if (headerDirection == '<') { 
          nx1 = nowtape*90;
          nx2 = nowtape*90+90;
          nx3 = (x1+x2)/2;
          y12 = 120;
          y3 = 80;
          newtape--;      
          HeaderVelocityLR = -1;
        } else if (headerDirection == '>') {
          nx1 = nowtape*90;
          nx2 = nowtape*90+90;
          nx3 = (x1+x2)/2;
          y12 = 120;
          y3 = 80;
          newtape++;
          HeaderVelocityLR = 1;
        }
}

void ChangeBerforeMove(){
        
        nowtape = newtape;
        nowStatus++;
        ni = i;
        statusFG(ni); 


        newHeader(headerDirection);
        
        ntape[nowtape] = "";
        ntape[nowtape]+= guchick[i].charAt(2);
        
        if (newCriclenum == 'A') hourValue = 0;
        else if (newCriclenum == 'B') hourValue = 1;
        else if (newCriclenum == 'C') hourValue = 2;
        println(headerDirection, newCriclenum, isequal);
        println(nowStringVlaue, guchickValue);
        println(i, "times");
}

void ReadyToCompare(){

      guchickValue = "";
      nowStringVlaue = "";
      nowStringVlaue += cycle[hourValue];
      nowStringVlaue += ntape[newtape];
      guchickValue += guchick[i].charAt(0);
      guchickValue += guchick[i].charAt(1);

      headerDirection = guchick[i].charAt(3);
      ndir = headerDirection;
      newCriclenum = guchick[i].charAt(4);
      
}
void ChangeHeaderPoint(){
    if (HeaderVelocityLR==1) {//right
      x1+=5; 
      x2+=5;
      x3 = (x1+x2)/2;
    } else if (HeaderVelocityLR == -1) {
      x1-=5;
      x2-=5;
      x3 = (x1+x2)/2;
    }
    if (HeaderVelocityLR==1&& x1>newtape*90-4) {
      y12-=10;
      y3-=10;
      trimove = false;
      delay(100);
    } else if (HeaderVelocityLR == -1&&x1<(newtape)*90+4) {
      y12-=10;
      y3-=10;
      trimove = false;
      delay(100);
    }
  }
