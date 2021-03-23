class Eye {
  int id;
  int x;
  int y;
  float eyeSize;
  
  float phase = 0;
  
  Eye(int x, int y, int eyeSize) {
    this.id = 0;
    this.x = x;
    this.y = y;
    this.eyeSize = eyeSize;
  }
  
  void draw() {
    pushMatrix();
    fill(150);
    ellipse(x, y, eyeSize, eyeSize);
    
    fill(240);
    ellipse(x, y, eyeSize-10, eyeSize-10);
    
    fill(10);
    PVector v1 = new PVector(mouseX - x, mouseY - y);
    v1.normalize();
    
    translate(12 * cos(v1.heading()), 12 * sin(v1.heading()));
    ellipse(x, y, eyeSize-40,eyeSize-40);
    
    fill(220);
    ellipse(x+8, y-8, 20, 20);
    
    phase += 0.05;
    
    popMatrix();
  }
}
