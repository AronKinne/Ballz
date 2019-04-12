class Player {

  PVector start, shootDir;
  ArrayList<Ball> balls;
  float interval;
  Game parentGame;

  Player(Game parentGame) {
    start = new PVector(width * .5, height - scl * .5);
    shootDir = null;
    balls = new ArrayList<Ball>();
    balls.add(new Ball(start, this));
    interval = 10;
    this.parentGame = parentGame;
  }

  void draw() {
    for (Ball b : balls) {
      b.draw();
      b.resolveCollision();
    }

    if (shootDir != null) {
      int left = balls.size();
      if (left > 0) {
        if (frameCount % interval == 0) {
          balls.get(balls.size() - left).go(shootDir);
          left--;
        }
      } else {
        shootDir = null;
      }
    }
  }

  public void go(float mX, float mY) {
    shootDir = new PVector(mX, mY).sub(start).normalize();
  }
}
