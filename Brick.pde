class Brick {

  PVector pos;
  int size;
  color col;
  
  Brick(float x, int size) {
    pos = new PVector(x, 0);
    this.size = size;
    col = color((size * 5) % 255, 255, 255);
  }
  
  void draw() {
    stroke(0);
    fill(col);
    rect(pos.x, pos.y, scl, scl);
    fill(0);
    textSize(scl / 3);
    textAlign(CENTER, CENTER);
    text(size, pos.x + scl * .5, pos.y + scl * .5);
  }
  
}