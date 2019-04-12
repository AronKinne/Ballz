class Player {

  PVector start, shootDir;
  ArrayList<Ball> balls;
  float interval;
  Game parentGame;
  int ballsWaiting;

  Player(Game parentGame) {
    start = new PVector(width * .5, height - scl * .5);
    shootDir = null;
    balls = new ArrayList<Ball>();
    balls.add(new Ball(start, this));
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
      if (ballsWaiting > 0) {
        if (frameCount % interval == 0) {
          balls.get(balls.size() - ballsWaiting).go(shootDir.copy());
          ballsWaiting--;
        }
      } else {
        shootDir = null;
      }
    }
  }

  void go(float mX, float mY) {
    shootDir = new PVector(mX, mY).sub(start).normalize();
    ballsWaiting = balls.size();
  }
}
