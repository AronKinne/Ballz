class Player {

  PVector start, shootDir;
  ArrayList<Ball> balls;
  float interval;
  Game parentGame;
  int ballsWaiting, ballsOut;

  Player(Game parentGame) {
    start = new PVector(width * .5, height - scl * .5);
    shootDir = null;
    balls = new ArrayList<Ball>();
    addBall();
    interval = 10;
    this.parentGame = parentGame;
  }

  void ff() {
    for (Ball b : balls) b.ff();
  }

  void draw() {
    noStroke();
    fill(255, 255, 255);
    circle(start.x, start.y, 10);
    
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

    ballsOut = 0;
    for (Ball b : balls) {
      b.draw();
      b.resolveCollision();

      if (b.out) ballsOut++;
    }

    if (ballsOut == balls.size()) {
      for (Ball b : balls) b.resetPos(start.copy());
      parentGame.waiting = true;
      game.next();
    }
  }

  void addBall() {
    balls.add(new Ball(start, this));
  }

  void setStart(float x) {
    start = new PVector(x, height - scl * .5);
  }

  void go(float mX, float mY) {
    shootDir = new PVector(mX, mY).sub(start).normalize();
    ballsWaiting = balls.size();
  }
}
