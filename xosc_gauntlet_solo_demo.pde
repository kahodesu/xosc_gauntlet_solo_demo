/////////////////////////////////////////////////////
///////  NEOPIXELS WITH XOSC   //////////////////////
/////////////////////////////////////////////////////
//Based on....                                     //
//RGB Control with Processing Example              //
//http://www.x-io.co.uk/rgb-control-with-processing//
//Send Simple Message by Ad Spiers - 12 Feb 2014   //
//and sent to X-OSC led via OSCP5 and netP5        //
//oscP5 website at http://www.sojamo.de/oscP5      //
/////////////////////////////////////////////////////

//LIBRARIES
import oscP5.*; 
import netP5.*; 

//color c = color(255, 204, 0);
//byte[] blob = new byte [90];

int gauntletLED = 0;             
int brightness = 0;
int counter=0;
OscP5 oscP5;
NetAddress tankLoc;//TANK location
NetAddress gauntletLoc;//GAUNTLET location

void setup() {
  size(255, 255); 
  frameRate(25);
LEDsetup();
  /* start oscP5, listening for incoming messages at port 9000 */
  oscP5 = new OscP5(this, 8000);
  /* IP Address of the X-OSC */
  gauntletLoc = new NetAddress("169.254.1.1", 9000);


}

void draw() {
  counter++;
patterns.get("flash").c1 = colors.get("white");
patterns.get("flash").doPattern(28);

}//