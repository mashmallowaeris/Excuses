import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float time =0;

Minim minim;
AudioPlayer player;
AudioInput input;

String[] Excuses;
int Excusecount;
String FinalExcuse ="";

void setup()
{
  minim = new Minim(this);
  player = minim.loadFile("Wheel.mp3");
  player.play();
  fullScreen();
  Excuses = loadStrings("Excuses.txt");
  Excusecount = Excuses.length;
  textSize(27);
  int ranNum = int(random(0,Excusecount));
  FinalExcuse = Excuses[ranNum];
}

void draw()
{
  background(0);
  fill(255);
  rect(0, 350, width, 80);
  sickTitle();
  textSize(27);
  fill(0);
  if(millis()-time <10500)
  {
    FinalExcuse = Generate();
  }
  text(FinalExcuse,30,400);
}

void keyPressed() {
    if(key == ' '){
    FinalExcuse = Generate();
    time = millis();
    player.rewind();
    player.play(); 
  }
}

String Generate()
{
  int ranNum = int(random(0,Excusecount));
  return Excuses[ranNum];
}

void sickTitle()
{
  fill(23, 255, 255);
  textSize(60);
  text("Trust these excuses", 400, 100);
}