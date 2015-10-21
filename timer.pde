int gameTime = 60000; //LENGTH OF GAME

//TIME VARS
Timer gameTimer, gauntletTimer, rustleTimer, leafTimer; 

void setUpTimer() {
  gameTimer = new Timer(gameTime);
  gameTimer.start();
  gauntletTimer = new Timer(5000);
 //// attackTimer = new Timer(int(random(15000,20000)));
//ttackTimer = new Timer(10000);
 // attackTimer.start();
  
 // rustleTimer = new Timer(3000);
 // leafTimer = new Timer(500);

}

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 10-5: Object-oriented timer


class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}