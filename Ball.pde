class Ball {
  
  PVector pos, vel;
  float r;
  color col;
  
  Ball(PVector pos) {
     this.pos = pos;
     this.vel = new PVector();
     r = 8;
     col = color(0);
  }
  
  void draw() {
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
  
  
}