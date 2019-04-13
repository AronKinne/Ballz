class Item extends Brick {
 
  float r;
  
  Item(float x) {
    super(x, 0); 
    
    r = scl * .2;
  }
  
  void draw() {
    stroke(0);
    fill(150, 255, 255);
    circle(pos.x + scl * .5, pos.y + scl * .5, r * 2);
  }
  
  boolean detectBall() {
    for (Ball b : game.p.balls) {
      if (dist(b.pos.x, b.pos.y, pos.x, pos.y) <= b.r + r) {        
        return true;
      }
    }
    return false;
  }
  
}
