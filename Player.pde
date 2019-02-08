class Player {

  int amt;
  PVector start;
  ArrayList<Ball> balls;
  float interval;

  Player() {
    amt = 0;
    start = new PVector(width * .5, height - scl * .5);
    balls = new ArrayList<Ball>();
    balls.add(new Ball(start));
    interval = 10;
  }

  void draw() {
    for (Ball b : balls) b.draw();
  }

  void go() {
    int left = amt;
    Thread thread = new Thread() {
      //while (left > 0) {
        if (frameCount % interval == 0) {
          balls.get(bals.size() - left).go();
          left--;
        }
      //}
    };
  }
}