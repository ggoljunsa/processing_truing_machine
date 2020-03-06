import processing.serial.*;

import processing.serial.*;
int lf = 10;//just simple number
String myString = null;
Serial myPort;
float num;
void setup(){
    background(255, 255, 255);
    size(600, 600);
    println(Serial.list());
    myPort = new Serial(this, Serial.list()[1], 9600);//배열+1 value is comx
}

void draw(){
    while(myPort.available()>0){
        myString = myPort.readStringUntil(lf);
        if(myString != null){
            num = float(myString);
            background(255, 255, 255);
            fill(287+num/10, 165+num/10, 55+num/10);
            ellipse(width/2, height/2, num/2, num/2);
        }
    }
    myPort.clear();
}
