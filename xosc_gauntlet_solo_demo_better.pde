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
byte[] blob = new byte [90];
pattern[] patterns = new pattern[3];
gameColor[] colors = new gameColor[3];
int gauntletLED = 0;
int brightness = 0;
int counter=0;
void setup() {
  size(255, 255); 
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 9000 */
  oscP5 = new OscP5(this, 8000);
  /* IP Address of the X-OSC */
  gauntletLoc =new NetAddress("169.254.1.1", 9000);

  patterns[0] = new solidPattern();
  patterns[1] = new flashPattern();
  patterns[2] = new fadeInPattern();


  colors[0] = new gameColor("white", 255);
  colors[1] = new gameColor("red", 255);
  colors[2] = new gameColor("blue", 255);
}

void draw() {
  counter++;
  int index = (counter / 250) % patterns.length;
  int cIndex = (counter / 100) % colors.length;
  patterns[index].doPattern(colors[cIndex], 28);
  gauntletShow();
//if (counter >0 && counter<=250) {
// gauntletColor("white", 255, gauntletLED);
////gauntletFlash("white", 27);
//gauntletLED++;
//gauntletShow();
//if (gauntletLED > 28)

//gauntletLED =0;

//}
//if (counter >250 && counter<=500) {
// // gauntletColor("white", 255, gauntletLED);
//gauntletFlash("white", 27);
//gauntletShow();

//}

//if (counter >500 && counter<=1000) {
//gauntletColor("red", brightness, 28);
//brightness++;
//gauntletShow();

//if (brightness > 255)

//brightness =0;

//}
//if (counter>1000) {
//counter = 0;
//}
println (counter);
}



/* This handles incoming messages, we are not using this right now */
/* incoming osc message are forwarded to the oscEvent method. */


//void colorMe(String colorName, int levels){
//  if (colorName == "red") {
//    //turn on LED color for as many levels
//    //the first 3 for 3 neopixels per level, second 3 for r, g, b. 
//    for (int i=0; i<levels * 3 * 3;i=i+3) {
//      blob[i] = byte(255);
//      blob[i+1] = byte(0);
//      blob[i+2] = byte(0);
//    }
//    //the rest is off
//    for (int i = levels * 3 * 3; i<blob.length;i=i+3) {
//      blob[i] = byte(0);
//      blob[i+1] = byte(0);
//      blob[i+2] = byte(0);
//    }
//  }
//  else if (colorName == "blue") {
//    //turn on LED color for as many levels
//    //the first 3 for 3 neopixels per level, second 3 for r, g, b. 
//    for (int i=0; i<levels * 3 * 3;i=i+3) {
//      blob[i] = byte(0);
//      blob[i+1] = byte(0);
//      blob[i+2] = byte(255);
//    }
//    //the rest is off
//    for (int i = levels * 3 * 3; i<blob.length;i=i+3) {
//      blob[i] = byte(0);
//      blob[i+1] = byte(0);
//      blob[i+2] = byte(0);
//    }
//  }
//  else if (colorName == "white") {
//    //turn on LED color for as many levels
//    //the first 3 for 3 neopixels per level, second 3 for r, g, b. 
//    for (int i=0; i<levels * 3 * 3;i=i+3) {
//      blob[i] = byte(255);
//      blob[i+1] = byte(255);
//      blob[i+2] = byte(255);
//    }
//    //the rest is off
//    for (int i = levels * 3 * 3; i<blob.length;i=i+3) {
//      blob[i] = byte(0);
//      blob[i+1] = byte(0);
//      blob[i+2] = byte(0);
//    }
//  }
//}