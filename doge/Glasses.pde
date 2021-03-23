class Glasses{
  PImage glasses;
  int x = 0;
  int y = 0;
  int steps = 0;
  float angle = 0;
  
  int y_offset = 0;
  float angle_offset = 0;
  
  Glasses(int x, int y, float angle) {
    glasses = loadImage("glasses.png");
    glasses.resize(0, 500);
    this.x = x;
    this.y = y;
    this.angle = angle;
  }
  
  void update() {
    if (steps < 100) {
      y_offset = -2000 + steps * 20;
      angle_offset = -20 + 0.2 * steps;
      
      steps += 1;
    }
  }
  
  void draw() {
    pushMatrix();
    
    imageMode(CENTER);
    translate(x, y + y_offset);
    rotate(angle + angle_offset);
    image(glasses, 0, 0);
    imageMode(CORNER);
    
    popMatrix();
  }
}
