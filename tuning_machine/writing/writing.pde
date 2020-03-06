String search = "def";
println(search);
String txt[] = {"Hello","PuzzleLeaf\nBlog","Star\nProject","!!!!!"};


void statusBar1(int nowTapeNUM, int prvTapeNUM){
  int x1 = nowTapeNUM*90;
  int x2 = nowTapeNUM*90+90;
  int x3 = (x1+x2)/2;
  int y12 = 120;
  int y3 = 80;
  triangle(x1, y12, x2, y12, x3, y3);
}

void statusBar(int nowTapeNUM, int prvTapeNUM){
  int LR = prvTapeNUM-nowTapeNUM
  if(LR>0){//right
    int i;
    for(i=nowTapeNUM*90; i<=prvTapeNUM*90; i++){
        basic();
        txting();
        statusBar1(i);
  }
  else{
     for(i=nowTapeNUM*90; i>=prvTapeNUM*90; i--){
        basic();
        txting();
        statusBar1(i);
        }
    }
  }
}
String[] sym = {"#", "$", "*"};
String tape = "# $ * 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0";
String[] ntape = split(tape, " ");

int i, j;
String gumin = "A**>A A$$>B B*$>A B$$>A";
String[] guchick = split(gumin, " ");
for(i=0; i<9; i++){
      rect(1200, 400+i*80, 600, 80);
    } 
    
    String st = "";
    st+=cycle[hourValue];
    st+=ntape[nowtape];
    for(i=0; i<len; i++){
      String issame = "";
      issame=guchick[i].substring(0,1);
      boolean isequal = issame.equals(st);
      if(isequal){
        ntape[i] = "";
        ntape[i]+= guchick[i].charAt(2);
        char dir = guchick[i].charAt(3);
        if(dir == '<') prvtape--;
        else if(dir == '>') prvtape++;
        char cyc = gychick[i].charAt(4);
        if(cyc == 'A') hourValue = 0;
        else if(cyc == 'B') hourValue = 1;
        else if(cyc == 'C') hourValue = 2;
        break;
      }
    }
    
void statusBar2(int nowTapeNUM){
  int x1 = nowTapeNUM*90;
  int x2 = nowTapeNUM*90+90;
  int x3 = (x1+x2)/2;
  int y12 = 120;
  int y3 = 80;
  fill(#7E9BFF);
  triangle(x1, y12, x2, y12, x3, y3);
}
statusBar2()
    
int hourValue = 0;

/*hourhand(hourValue);
  statusBar1(nowtape, prvtape);
  if(prvtape<20){ prvtape++;
  nowtape = prvtape-1;
}
  else prvtape = 0;
  if(hourValue>1) hourValue = 0;
  else hourValue++;*/
