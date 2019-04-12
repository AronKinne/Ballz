class Brick {

  PVector pos;
  int size;
  color col;

  Brick(float x, int size) {
    pos = new PVector(x, 0);
    this.size = size;
  }

  void draw() {
    col = color((size * 5) % 255, 255, 255);
    stroke(0);
    fill(col);
    rect(pos.x, pos.y, scl, scl);
    fill(0);
    textSize(scl / 3);
    textAlign(CENTER, CENTER);
    text(size, pos.x + scl * .5, pos.y + scl * .5);
  }

  boolean detectBall() {
    for (Ball b : game.p.balls) {
      if (b.pos.y + b.r > pos.y && b.pos.y - b.r < pos.y + scl && b.pos.x - b.r < pos.x + scl && b.pos.x + b.r > pos.x) {
        if (b.vel.x < 0 && b.vel.y < 0) {        // R U
          if (b.pos.x > pos.x + scl) {
            b.vel.x *= -1;
            b.pos.x = pos.x + scl + b.r;
          }
          if (b.pos.y > pos.y + scl) {
            b.vel.y *= -1;
            b.pos.y = pos.y + scl + b.r;
          }
        } else if (b.vel.x < 0 && b.vel.y > 0) {        // R O
          if (b.pos.x > pos.x + scl) {
            b.vel.x *= -1;
            b.pos.x = pos.x + scl + b.r;
          }
          if (b.pos.y < pos.y) {
            b.vel.y *= -1;
            b.pos.y = pos.y - b.r;
          }
        } else if (b.vel.x > 0 && b.vel.y < 0) {      // L U
          if (b.pos.x < pos.x) {
            b.vel.x *= -1;
            b.pos.x = pos.x - b.r;
          }
          if (b.pos.y > pos.y + scl) {
            b.vel.y *= -1;
            b.pos.y = pos.y + scl + b.r;
          }
        } else if (b.vel.x > 0 && b.vel.y > 0) {    // L O
          if (b.pos.x < pos.x) {
            b.vel.x *= -1;
            b.pos.x = pos.x - b.r;
          }
          if (b.pos.y < pos.y) {
            b.vel.y *= -1;
            b.pos.y = pos.y - b.r;
          }
        }

        size--;
        return true;
      }
    }
    return false;
  }
}
