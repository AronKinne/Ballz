class Game {
 
  int level;
  ArrayList<Wave> waves;
  Player p;
  boolean waiting;
  
  Game() {
    level = 1;
    waves = new ArrayList<Wave>();
    p = new Player(this);
    waiting = true;
    
    waves.add(new Wave(level));
  }
  
  void next() {
    level++;
    for(Wave w : waves) w.down();
    
    waves.add(new Wave(level));
    
    p.addBall();
  }
  
  void ff() {
    p.ff(); 
  }
  
  void mousePressed() {
    if(waiting) {
      p.go(mouseX, mouseY);
      waiting = false;
    }
  }
  
  void draw() {
    for(Wave w : waves) {
      w.draw();
    }
    
    p.draw();
    
    fill(0, 255, 255);
    textSize(scl *.5);
    textAlign(LEFT, BOTTOM);
    text(level, scl * .25, height - scl * .25);
  }
  
}
