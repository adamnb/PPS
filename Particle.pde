class Particle {
  public Particle[] parentField;
  
  public Vector position;
  public float orientation; // phi
  public color stateColor; 
  public int neighbors;
  
  public float velocity; // v
  public float intrinsicAngle; // alpha
  public float reactiveAngle; // beta
  public float interactRadius; // r
  
  public float sine;
  public float cosine;
  
  public Particle (Particle[] parentField, Vector position, float orientation, float velocity, float intrinsicAngle, float reactiveAngle, float interactRadius) {
    this.parentField = parentField; // parent field reference
    this.position = position;
    this.orientation = orientation;
    this.velocity = velocity;
    this.intrinsicAngle = intrinsicAngle;
    this.reactiveAngle = reactiveAngle;
    this.interactRadius = interactRadius;
    stateColor = #32a852;
  }
  
  public void step () {
    
  // 1) Find neighbors
    int[] n = countNeighbors();
    neighbors = n[2];
    stateColor = lerpColor(color(52, 235, 55), color(214, 36, 36), float(n[2])/50);
  // 2) Rotate
    orientation += intrinsicAngle + reactiveAngle * n[2] * Utils.sign(n[1]-n[0]);
    orientation = Utils.unwind(orientation);
    
    sine = sin(orientation);
    cosine = cos(orientation);
  // 3) Move
    move();
  
  }
  
  private void move() {
    position.x += cosine*velocity;
    position.y += sine*velocity;
    
    if (position.x > width)
      position.x = 0;
    if (position.y > height)
      position.y = 0;
    if (position.x < 0)
      position.x = width;
    if (position.y < 0)
      position.y = height;
  }

  private int[] countNeighbors () {
    int l = 0; int r = 0;
    for (Particle p: parentField) {
      if (p != this) {
        Vector posDiff = position.subtract(p.position);
        if (abs(posDiff.x) <= interactRadius && abs(posDiff.y) <= interactRadius) { // Rule out impossible neighbors
          float dist = sqrt(posDiff.x*posDiff.x + posDiff.y*posDiff.y);
          if (dist <= interactRadius) {
            if (posDiff.x*sine-posDiff.y*cosine < 0) // Literally no fucking idea how this works
              r++;
            else
              l++;
          }
        }
      }
    }
    return new int[] {l, r, l+r};
  }  
}
