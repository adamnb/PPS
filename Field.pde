class Field {
  static final int particleDrawSize = 4;
  public boolean getCrowding = true;
  
  public int t = 0;
  public float crowding = 0;
  
  private Particle[] particles;
  
  public Field (int size, float v, float r, float a, float b) {
    particles = new Particle[size];
    
    for (int i = 0; i < particles.length; i++) {
      particles[i] = new Particle (particles, new Vector (random(width), random(height)), random(2*PI), v, a, b, r);
    }
  }
  
  public void display (boolean includeAngle, boolean includeRadius) {
    for (Particle p: particles) {
      strokeWeight(particleDrawSize);
      stroke(p.stateColor);
      point(p.position.x, p.position.y);
      
      if (includeAngle) {
        strokeWeight(2);
        stroke(0, 0, 0, 191);
        line(p.position.x, p.position.y, 
          p.position.x+(particleDrawSize/2)*p.cosine, 
          p.position.y+(particleDrawSize/2)*p.sine
        );
      }
      
      if (includeRadius) {
        strokeWeight (1);
        stroke(p.stateColor);
        circle(p.position.x, p.position.y, p.interactRadius*2);
      }
    }
  }
  
  public void step () {
    t++;
    int totalNeighbors = 0;
    for (Particle p: particles) {
      p.step();
      
      if (getCrowding) {
        totalNeighbors += p.neighbors;
      }
    }
    crowding = float(totalNeighbors)/float(particles.length);
    println(crowding);
  }
  
    
}
