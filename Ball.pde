class Ball {
  
  PVector pos, vel;
  float r, speed;
  color col;
  boolean moving;
  
  Ball(PVector pos) {
     this.pos = pos;
     this.vel = new PVector();
     r = 8;
     speed = 3;
     col = color(0);
     moving = false;
  }
  
  void draw() {    
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, r * 2, r * 2);
    
    if(moving) {
      pos.add(vel); 
    }
  }
  
  void go(PVector dir) {
    vel = dir.copy().mult(speed);
    moving = true;
  }
  
}
