class Module {
  float x, y;
  float spread = 1.5;
  int id;
  
  // Contructor
  Module(int idx,int xx,int yy) {
    id = idx;
    x = xx;
    y = yy;
  }
  
  // Custom method for updating the variables
  void update() {
    spread = spread * -1;
  }
  
  // Custom method for drawing the object
  void draw() {
    fill(255);
    ellipse(x, y, 50+10*spread, 50+10*spread);
  }
}
