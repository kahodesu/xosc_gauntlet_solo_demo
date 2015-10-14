//////////////////////VARIABLES//////////////////////////////

byte[] gauntletBlob = new byte [84];

//////////////////////FUNCTIONS//////////////////////////////


class gameColor {
  public int R; 
  public int G;
  public int B;

  public gameColor(String colorName, int brightness) {

    if (colorName == "red") {
      R = brightness;
      G =0;
      B =0;
    }
    if (colorName == "blue") {
      R = 0;
      G =0;
      B =brightness;
    }
    if (colorName == "white") {
      R = brightness;
      G = brightness;
      B = brightness;
    }
  }
}


class pattern {
  public void gauntletWipe() {
    for (int i = 0; i<gauntletBlob.length; i++) {
      gauntletBlob[i] = byte(0);
    }
  }
  public void doPattern(gameColor c, int levels) {
  }
}

class flashPattern extends pattern {

 @Override
    public void doPattern(gameColor c, int levels) {

    gauntletWipe();
    for (int i=0; i<int(levels/2); i++) {
      int ranLevel = int(random(levels));
      //for (int j=0; j<3; j++) {
        gauntletBlob[(ranLevel*3)] = byte(c.R);
        gauntletBlob[(ranLevel*3)+1] = byte(c.G);
        gauntletBlob[(ranLevel*3)+2] = byte(c.B);
      //}
      //println(i);//FOR DEBUG
    }
  }
}

class fadeInPattern extends pattern{
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

class solidPattern extends pattern {
 // @Override
    public void doPattern(gameColor c, int levels) {

    gauntletWipe();
    for (int i=0; i<levels * 3; i=i+3) {
      gauntletBlob[i] = byte(c.R);
      gauntletBlob[i+1] = byte(c.G);
      gauntletBlob[i+2] = byte(c.B);
    }
  }
}