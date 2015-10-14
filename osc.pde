///////////LIBRARIES////////////
import oscP5.*;
import netP5.*;

///////////VARIABLES TO SET////////////
OscP5 oscP5;
NetAddress tankLoc;//TANK location
NetAddress gauntletLoc;//GAUNTLET location
 
int gauntletCounter=0;
 boolean gTimer = false;
int hiThresh = 40;
int lowThresh = 3;
float[] tankIMU = new float[10];
float[] gauntletIMU = new float[10];
int[] digitalInputs = new int[16];
float[] analogueInputs = new float[16];
int tankIMUx, tankIMUy, tankIMUz;
int gauntletIMUx, gauntletIMUy, gauntletIMUz;

int holdingHands;
boolean EL = false;
boolean gauntletFull=false;
//////////////FUNCTIONS////////////////

void OSCsetup() {

  oscP5 = new OscP5(this, 8000);

  tankLoc = new NetAddress("169.254.1.1", 9000);
delay(100);
  gauntletLoc = new NetAddress("169.254.1.2", 9000);
}

/////////////////////////////////////////////////
void oscEvent(OscMessage theOscMessage) {
}
//////
//////////////////////////////////////////////////





void gauntletShow() {
  OscMessage myMessage = new OscMessage("/outputs/rgb/1"); //address pattern
  myMessage.add(gauntletBlob); //puts blob into message
  //println(" myMessage: "+myMessage); //FOR DEBUG
  oscP5.send(myMessage, gauntletLoc);//sends blob over
}