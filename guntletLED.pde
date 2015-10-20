//////////////////////VARIABLES TO CHANGE//////////////////////////////
int gauntletLEDNum = 28; //put the number of neopixels

//////////////////////VARIABLES//////////////////////////////
byte[] gauntletBlob = new byte [gauntletLEDNum * 3]; //3 is for  R G B values. this blog array is what gets sent to the xOSC
HashMap<String, gameColor> colors = new HashMap<String, gameColor>();
HashMap<String, pattern> patterns = new HashMap<String, pattern>();

//////////////////////CLASSES//////////////////////////////
void LEDsetup() {
  ///setting up names for Hashmap
  colors.put("white", new gameColor(255, 255, 255));
  colors.put("yellow", new gameColor(255, 255, 0));
  colors.put("red", new gameColor(255, 0, 0));
  colors.put("orange", new gameColor(255, 140, 0));
  colors.put("blue", new gameColor(0, 0, 255));
  colors.put("cyan", new gameColor(0, 255, 255));
  colors.put("pink", new gameColor(255, 0, 255));
  colors.put("purple", new gameColor(138, 43, 255));
  colors.put("green", new gameColor(0, 255, 0));
  colors.put("aqua", new gameColor(102, 205, 170));

  patterns.put("solid", new solid());
  patterns.put("fire", new fire());
  patterns.put("fadeIn", new fadeIn());
  patterns.put("flash", new flash());
}
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

class gameColor {
    int R, G, B;
    public gameColor (int r, int g, int b){
      R = r;
      G = g;
      B = b; 
  }
}

//This is the parent class called pattern
class pattern {
  gameColor c1; 
  pattern() {
  }  

  void gauntletWipe() { // wipes the LEDs, this function is inherited by all the kids
    for (int i = 0; i<gauntletBlob.length; i++) {
      gauntletBlob[i] = byte(0);
    }
  }
  void doPattern(int levels) {   //this one is emtpy cause the kids will fill it in
  }

  void gauntletShow() {
    OscMessage myMessage = new OscMessage("/outputs/rgb/1"); //address pattern
    myMessage.add(gauntletBlob); //puts blob into message
    //println(' myMessage: '+myMessage); //FOR DEBUG
    oscP5.send(myMessage, gauntletLoc);//sends blob over
  }
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

class solid extends pattern {
  solid() {
  }

  void doPattern(int levels) { //this is the part that fits into the parent class
    gauntletWipe();
    for (int i=0; i<levels * 3; i=i+3) {
      gauntletBlob[i] = byte(c1.R);
      gauntletBlob[i+1] = byte(c1.G);
      gauntletBlob[i+2] = byte(c1.B);
    }
    gauntletShow();
  }
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

class flash extends pattern {
  //@Override
  void doPattern(int levels) {

    gauntletWipe();
    for (int i=0; i<int(levels/2); i++) {
      int ranLevel = int(random(levels));
      gauntletBlob[(ranLevel*3)] = byte(c1.R);
      gauntletBlob[(ranLevel*3)+1] = byte(c1.G);
      gauntletBlob[(ranLevel*3)+2] = byte(c1.B);
    }
    gauntletShow();
  }
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

class fadeIn extends pattern {
  double intensity = 1.0;
  @Override
    void doPattern(int levels) {
    intensity -= 0.01;
    gauntletWipe();
    for (int i=0; i<levels * 3; i=i+3) {
      gauntletBlob[i] = byte((int)(c1.R * intensity));
      gauntletBlob[i+1] = byte((int)(c1.G * intensity));
      gauntletBlob[i+2] = byte((int)(c1.B * intensity));
    }
    gauntletShow();
  }
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

class fire extends pattern {
  public pattern flame =  new solid(); 
  public pattern flicker = new flash();
  public gameColor c2; 
  public int counter; 
  @Override
    public void doPattern(int levels) {
    counter += 1;
    if ((counter /2) % 2 == 0) {
      flame.c1 = c1;
      flame.doPattern(levels); //runs super class which is solidPattern
    } else {
      flicker.c1 = c2; 
      flicker.doPattern(levels);
    }
    gauntletShow();
  }
}