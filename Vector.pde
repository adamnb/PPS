class Vector {
  public float x;
  public float y;
  
  public Vector (float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public Vector (float size) { this(size, size); }
  
  public String toString () {
    return "(" + x + ", " + y + ")";
  }
  
  
  public Vector add (Vector v) {
    return new Vector (x+v.x, y+v.y);
  }
  
  public Vector subtract (Vector v) {
    return new Vector (v.x-x, v.y-y);
  }
  
  public float getLength () { 
    return sqrt (x*x + y*y);
  }
  
  public float getAngle () {
    return atan2(y, x);
  }
  
}
