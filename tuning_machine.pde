int i, j = 2;
int hourValue = 0;
int nowtape = 0, newtape = 0;

String gumin = "A*#>B A#$>C A$*>C A0#>B B*$>A B#*>C B$$>A B0#>C C**>A C#$>B C$*>A C0#<B";
String[] guchick = split(gumin, " ");
int len = guchick.length;

String tape = "# # * 0 0 0 0 0 $ 0 0 0 0 * 0 0 0 0 0 0 0 0";
String[] ntape = split(tape, " ");

char [] cycle = {'A', 'B', 'C'};
String[] sym = {"#", "$", "*"};

String guchickValue = "";
String nowStringVlaue = "";

char newCriclenum;
char headerDirection;

boolean isequal;
boolean trimove = false;
boolean firstChanging = false;

int x1 = 0, x2 = 90, x3 = (x1+x2)/2, y12 = 120, y3 = 80;
int HeaderVelocityLR;
int nx1, nx2, nx3;
char ndir;
int ni;// for statusflag

int nowStatus = 1;

void setup()
{
    size(1800, 1200);
    textSize(60);
    basic();
    //noLoop();// this program runs only you press the mouse
}

void draw()
{
    basic();
    fill(#FF9F29);
    triangle(x1, y12, x2, y12, x3, y3);
    txting();
    if (newtape>19)
    {
        text("END", 800, 800);
        return;
    }
    if (trimove == false)
    {
        println("nwetape ",newtape);
        firstChanging = true;
        for (i=0; i<len; i++)
        {
            ReadyToCompare();
            isequal = guchickValue.equals(nowStringVlaue);
            if (isequal&&firstChanging)
            {
                firstChanging = false;
                ChangeBerforeMove();
                trimove = true;
            }
        }
        noLoop();
    }
    else if (trimove==true)
    {
        loop();
        ChangeHeaderPoint();
    }
}
void keyPressed()
{
    redraw();
}

void mousePressed()
{
    redraw();
}
