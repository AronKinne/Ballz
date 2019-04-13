class Ball {

  PVector pos, vel;
  float r, speed;
  color col;
  boolean moving, out;
  Player parentPlayer;

  Ball(PVector pos, Player parentPlayer) {
    this.pos = pos.copy();
    this.vel = new PVector();
    r = 8;
    speed = 8;
    col = color(0);
    moving = false;
    out = false;
    this.parentPlayer = parentPlayer;
  }
  
  void resetPos(PVector pos) {
    this.pos = pos.copy();
    vel = new PVector();
    out = false;
    moving = false;
  }

  void draw() {    
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, r * 2, r * 2);
    
    if (moving) {
      pos.add(vel);
    }
  }

  void go(PVector dir) {
    if (!moving) {
      vel = dir.copy().mult(speed);
      moving = true;
    }
  }

  void resolveCollision() {
    if (pos.x + r > width) {
      pos.x = width - r;
      vel.x *= -1;
    } else if (pos.x - r < 0) {
      pos.x = r;
      vel.x *= -1;
    } else if (pos.y - r < 0) {
      pos.y = r;
      vel.y *= -1;
    } else if (pos.y - r > height && !out) {
      out = true;
      if(parentPlayer.ballsOut == 0) parentPlayer.setStart(pos.x);
    }
  }
}
