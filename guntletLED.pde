//////////////////////VARIABLES//////////////////////////////

byte[] gauntletBlob = new byte [84];

//////////////////////FUNCTIONS//////////////////////////////

void gauntletColor(String colorName, int brightness, int levels){
//--------------------------------------------------------------------
  if (colorName == "red") {
    //turn on LED color for as many levels
    //the first 3 for 3 neopixels per level, second 3 for r, g, b. 
    gauntletWipe();
    for (int i=0; i<levels * 3; i=i+3) {
      gauntletBlob[i] = byte(brightness);
      gauntletBlob[i+1] = byte(0);
      gauntletBlob[i+2] = byte(0);
    }
    
  }
//--------------------------------------------------------------------
  else if (colorName == "blue") {
    //turn on LED color for as many levels
    //the first 3 for 3 neopixels per level, second 3 for r, g, b. 
    gauntletWipe();
    for (int i=0; i<levels * 3;i=i+3) {
      gauntletBlob[i] = byte(0);
      gauntletBlob[i+1] = byte(0);
      gauntletBlob[i+2] = byte(brightness);
    }
   
  }
//--------------------------------------------------------------------
  else if (colorName == "white") {
    //turn on LED color for as many levels
    //the first 3 for 3 neopixels per level, second 3 for r, g, b. 
    gauntletWipe();
    for (int i=0; i<levels * 3;i=i+3) {
      gauntletBlob[i] = byte(brightness);
      gauntletBlob[i+1] = byte(brightness);
      gauntletBlob[i+2] = byte(brightness);
    }
    
  }
//--------------------------------------------------------------------
  else if (colorName == "teal") {
    //turn on LED color for as many levels
    //the first 3 for 3 neopixels per level, second 3 for r, g, b. 
    gauntletWipe();
    for (int i=0; i<levels * 3;i=i+3) {
      gauntletBlob[i] = byte(brightness);
      gauntletBlob[i+1] = byte(brightness);
      gauntletBlob[i+2] = byte(0);
    }
   
  } 
}


void gauntletFlash(String colorName, int levels) {
  if (colorName == "white") {
    //turn on LED color for as many levels
    //the first 3 for 3 neopixels per level, second 3 for r, g, b.
      gauntletWipe();
      for (int i=0; i<int(levels/2); i++) {
        int ranLevel = int(random(levels));
        for (int j=0; j<3; j++) {
          gauntletBlob[(ranLevel*3)+j] = byte(255);
          gauntletBlob[(ranLevel*3)+(j+1)] = byte(255);
          gauntletBlob[(ranLevel*3)+(j+2)] = byte(255);
        }
     //println(i);//FOR DEBUG
    }
  } 
}

void gauntletWipe(){
for (int i = 0; i<gauntletBlob.length;i++) {
      gauntletBlob[i] = byte(0);

    }
}