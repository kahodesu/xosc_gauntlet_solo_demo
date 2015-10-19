//////////////////////VARIABLES TO CHANGE//////////////////////////////

int gauntletLEDNum = 28; //put the number of neopixels
gameColor[] colors = new gameColor[10];

//gameColor[] colors = {gameColor("white", 255), gameColor("yellow", 255), gameColor("orange", 255), gameColor("blue", 255), gameColor("cyan", 255), gameColor("pink", 255), gameColor("purple", 255), gameColor("green", 255), gameColor("aqua", 255)}; //list all your colors here
pattern[] patterns = new pattern[4]; //

//////////////////////VARIABLES//////////////////////////////
byte[] gauntletBlob = new byte [gauntletLEDNum * 3]; //3 is for  R G B values. this blog array is what gets sent to the xOSC

//////////////////////CLASSES//////////////////////////////
void LEDsetup() {
  colors[0] = new gameColor("white", 255);
  colors[1] = new gameColor("yellow", 255);
  colors[2] = new gameColor("orange", 255);
  colors[3] = new gameColor("blue", 255);
  colors[4] = new gameColor("cyan", 255);
  colors[5] = new gameColor("pink", 255);
  colors[6] = new gameColor("purple", 255);
  colors[7] = new gameColor("green", 255);
  colors[8] = new gameColor("aqua", 255);
  colors[9] = new gameColor("red", 255);


  patterns[0] = new solidPattern();
  patterns[1] = new fire();
  patterns[2] = new fadeInPattern();
  patterns[3] = new flashPattern();

 // ((twoColorFlashPattern)patterns[1]).p = new flashPattern();
}

//This is the parent class called pattern
class pattern {

  public void gauntletWipe() { // wipes the LEDs, this function is inherited by all the kids
    for (int i = 0; i<gauntletBlob.length; i++) {
      gauntletBlob[i] = byte(0);
    }
  }
  public void doPattern(gameColor c, int levels) {   //this one is emtpy cause the kids will fill it in
  }
}

//These are the kids ok
class solidPattern extends pattern {
  @Override  //this is optional but helps to debug apparently
    public void doPattern(gameColor c, int levels) { //this is the part that fits into the parent class
    gauntletWipe();
    for (int i=0; i<levels * 3; i=i+3) {
      gauntletBlob[i] = byte(c.R);
      gauntletBlob[i+1] = byte(c.G);
      gauntletBlob[i+2] = byte(c.B);
    }
  }
}

class fire extends pattern {
  public pattern flame =  new solidPattern(); 
  public pattern flicker = new flashPattern(); 
  public int counter; 
  @Override
    public void doPattern(gameColor c, int levels) {
    counter += 1;
    if (counter %2 == 0) {
      flame.doPattern(colors[2], 28); //runs super class which is solidPattern
    } 
    else {    
      flicker.doPattern(colors[9], 28);
    }
  }
}


class flashPattern extends pattern {
  @Override
    public void doPattern(gameColor c, int levels) {

    gauntletWipe();
    for (int i=0; i<int(levels/2); i++) {
      int ranLevel = int(random(levels));
      gauntletBlob[(ranLevel*3)] = byte(c.R);
      gauntletBlob[(ranLevel*3)+1] = byte(c.G);
      gauntletBlob[(ranLevel*3)+2] = byte(c.B);
    }
  }
}

class fadeInPattern extends pattern {
  double intensity = 1.0;
  @Override
    public void doPattern(gameColor c, int levels) {
    intensity -= 0.01;
    gauntletWipe();
    for (int i=0; i<levels * 3; i=i+3) {
      gauntletBlob[i] = byte((int)(c.R * intensity));
      gauntletBlob[i+1] = byte((int)(c.G * intensity));
      gauntletBlob[i+2] = byte((int)(c.B * intensity));
    }
  }
}






//this is for color names 
class gameColor {
  public int R; 
  public int G;
  public int B;

  public gameColor(String colorName, int brightness) {
    if (colorName == "white") {
      R = brightness;
      G = brightness;
      B = brightness;
    }
    if (colorName == "red") {
      R = brightness;
      G =0;
      B =0;
    }
    if (colorName == "orange") {//255,140,0
      R = brightness;
      G = brightness * 75/255;
      B = 0;
    }
    if (colorName == "yellow") {//(255,255,0)
      R = brightness;
      G = brightness;
      B = 0;
    }
    if (colorName == "blue") {
      R = 0;
      G = 0;
      B = brightness;
    }
    if (colorName == "cyan") {//   (0,255,255)
      R = 0;
      G = brightness;
      B = brightness;
    }
    if (colorName == "pink") {//(255, 0 ,255)
      R = brightness;
      G = 0;
      B = brightness;
    }
    if (colorName == "purple") {  //138,43,226
      R = brightness * 138/255;
      G = brightness * 43/255;
      B = brightness;
    }
    if (colorName == "green") {
      R = 0;
      G = brightness;
      B = 0;
    }
    if (colorName == "aqua") { //102,205,170
      R = brightness * 102/255;
      G = brightness;
      B = brightness * 170/255;
    }
  }
}