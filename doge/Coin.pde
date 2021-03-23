class Coin {
  
  PImage coin_texture;
  float angle_offset = 0;
  float x = 0;
  float y = 0;
  float speed = 0;
  int size = 0;
  
  Coin(){
    this.size = int(random(50, 200));
    this.coin_texture = loadImage("coin.png");
    this.coin_texture.resize(0, this.size);
    this.x = random(0, width);
    this.speed = random(4, 10);
    this.y = 0;
  }
  
  void update() {
    angle_offset += 0.1;
    y += speed;
  }
  
  void draw() {
    pushMatrix();
    
    imageMode(CENTER);
    translate(x, y);
    rotate(angle_offset);
    image(coin_texture, 0, 0);
    imageMode(CORNER);
    
    popMatrix();
  }
  
}
