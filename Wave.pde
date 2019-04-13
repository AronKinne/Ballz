class Wave {

  ArrayList<Brick> bricks;
  float y;
  float doubleAmtPerc, doubleSizePerc;
  int level;
  Item item;

  Wave(int level, boolean spawnItem) {
    bricks = new ArrayList<Brick>();
    y = 0;
    doubleAmtPerc = .4;
    doubleSizePerc = .4;
    this.level = level;

    int amt = (int)random(1, 4);
    if (random(1) < doubleAmtPerc) amt *= 2;
    for (int i = 0; i < amt; i++) {
      spawnBrick(false);
    }

    if (spawnItem) spawnBrick(true);
  }

  void down() {
    for (Brick b : bricks) {
      b.pos.y += scl;
    }
    if (item != null) {
      item.pos.y += scl;
    }
  }

  void draw() {
    for (int i = bricks.size() - 1; i >= 0; i--) {
      Brick b = bricks.get(i);
      b.draw();
      b.detectBall();
      if (b.size <= 0) bricks.remove(b);
    }

    if (item != null) {
      item.draw();
      if(item.detectBall()) {
        game.addBalls++;
        item = null;
      }
    }
  }

  void spawnBrick(boolean spawnItem) {
    int x = (int)random(7) * scl;
    boolean avail = true;
    for (Brick b : bricks) {      
      if (b.pos.x == x) {
        avail = false;
        break;
      }
    }
    if (avail) {
      if (spawnItem) {
        item = new Item(x);
      } else {
        int size = level;
        if (random(1) < doubleSizePerc) size *= 2;
        bricks.add(new Brick(x, size));
      }
    } else {
      spawnBrick(spawnItem);
    }
  }
}
