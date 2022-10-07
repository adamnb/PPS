class Field {
  static final int particleDrawSize = 5;
  static final boolean randomSpread = true;
  public boolean getCrowding = false;
  
  public float v, r, a, b;
  
  public int t = 0;
  public float crowding = 0;
  
  private Particle[] particles;
  
  public Field (int size, float v, float r, float a, float b) {
    particles = new Particle[size];
    
    this.v = v;
    this.r = r;
    this.a = a;
    this.b = b;
    
    for (int i = 0; i < particles.length; i++) {
      Vector origin = new Vector(width/2, height/2);
      if (randomSpread) 
        origin =  new Vector(random(0, width), random(0, height));
      
      particles[i] = new Particle (particles, origin, random(2*PI), this.v, this.a, this.b, this.r);
    }
  }
  
  public Field (int size, Ruleset ruleset) {
    this(size, ruleset.velocity, ruleset.radius, ruleset.intrinsicAngle, ruleset.reactiveAngle);
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
    crowding = getCrowding ? float(totalNeighbors)/float(particles.length) : 0;
  }   
}
