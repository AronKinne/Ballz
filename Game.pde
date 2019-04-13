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
  }
  
}
