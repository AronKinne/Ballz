// To do: In Player class: spawn interval for balls in go()

int scl = 50;
Game game;

void setup() {
  size(350, 500);
  colorMode(HSB);

  game = new Game();
}

void draw() {
  background(255);

  game.draw();
}

void keyPressed() {
  if (key == ' ')game.next();
}

void mousePressed() {
  game.mousePressed();
}