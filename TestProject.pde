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
  size(1000,800);
  Excuses = loadStrings("Excuses.txt");
  Excusecount = Excuses.length;
  textSize(15);
  int ranNum = int(random(0,Excusecount));
  FinalExcuse = Excuses[ranNum];
}

void draw()
{
  background(0);
  if(millis()-time <10500)
  {
    FinalExcuse = Generate();
  }
  text(FinalExcuse,200,400);
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