import processing.sound.*;
SoundFile sound;

Eye eye_l;
Eye eye_r;

PImage doge;

Glasses glasses;
ArrayList<Coin> coins = new ArrayList<Coin>(); 

int offset_x = 400;
int offset_y = 250;

boolean ganster_mode_trigger = false;
boolean ganster_mode = false;

void setup() {
  size(1920, 1080);
  //noCursor();
  
  eye_l = new Eye(270+offset_x, 305+offset_y, 90);
  eye_r = new Eye(470+offset_x, 350+offset_y, 100);
  
  doge = loadImage("doge.png");
  doge.resize(0, 1000);
}


void draw() {
  
  background(50);
  
  // draw eyes
  eye_l.draw();
  eye_r.draw();
  
  // draw doge
  image(doge, offset_x, offset_y);
  
  // ganster mode?
  if (ganster_mode_trigger && !ganster_mode) {
    ganster_mode_trigger = false;
    ganster_mode = true;
    
    glasses = new Glasses(offset_x+340, offset_y+330, PI/8);
    
    coins.clear();
    for (int i = 0; i < 30; i++) {
      Coin coin = new Coin(); 
      coins.add(coin);
    }
    
    // Load a soundfile from the /data folder of the sketch and play it back
    sound = new SoundFile(this, "thuglife.mp3");
    sound.play(); 
  }

  if (ganster_mode) {
    glasses.update();
    glasses.draw();
    
    for (int i = 0; i < coins.size(); i++) {
      Coin coin = coins.get(i); 
      coin.update();
      coin.draw();
    }
    
    // check coin out of screen (and delete)
    for (int i = 0; i < coins.size();) {
      Coin coin = coins.get(i);  
      if (coin.y > height + 200){
        coins.remove(coin);
      }
      else {
        i++;
      }
    }
    
    if (!sound.isPlaying()) {
      ganster_mode = false;
    }
    
  }
}


void mousePressed(){
  ganster_mode_trigger = true;
}
