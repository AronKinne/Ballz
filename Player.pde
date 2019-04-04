class Player {

  PVector start, shootDir;
  ArrayList<Ball> balls;
  float interval;

  Player() {
    start = new PVector(width * .5, height - scl * .5);
    shootDir = null;
    balls = new ArrayList<Ball>();
    balls.add(new Ball(start));
    interval = 10;
  }

  void draw() {
    for (Ball b : balls) b.draw();

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
