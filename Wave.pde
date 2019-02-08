class Wave {

  ArrayList<Brick> bricks;
  float y;
  float doubleAmtPerc, doubleSizePerc;
  int level;

  Wave(int level) {
    bricks = new ArrayList<Brick>();
    y = 0;
    doubleAmtPerc = .4;
    doubleSizePerc = .4;
    this.level = level;

    int amt = (int)random(1, 4);
    if (random(1) < doubleAmtPerc) amt *= 2;
    for (int i = 0; i < amt; i++) {
      spawnBrick();
    }
  }
  
  void down() {
    for(Brick b : bricks) {
      b.pos.y += scl;
    }
  }
  
  void draw() {
    for(Brick b : bricks) b.draw(); 
  }

  void spawnBrick() {
    int x = (int)random(7) * scl;
    boolean avail = true;
    for (Brick b : bricks) {
      if (b.pos.x == x) {
        avail = false;
        break;
      }
    }
    if (avail) {
      int size = level;
      if(random(1) < doubleSizePerc) size *= 2;
      bricks.add(new Brick(x, size));
    } else {
      spawnBrick(); 
    }
  }
  
}