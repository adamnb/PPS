class Ruleset {
  public static final float MULT = 10;
  
  public float velocity; 
  public float radius; 
  public float intrinsicAngle; 
  public float reactiveAngle;
  
  public Ruleset (float velocity, float radius, float intrinsicAngle, float reactiveAngle) {
    this.velocity = velocity * MULT;
    this.radius = radius * MULT;
    this.intrinsicAngle = intrinsicAngle;
    this.reactiveAngle = reactiveAngle;
  }
  
  public String toString () {
    return "α = " + intrinsicAngle + "\nβ = " + reactiveAngle + "\nr = " + radius + "\nv = " + velocity; //<>//
  }
}

Ruleset tmk = new Ruleset (0.67, 5, PI, 0.296706);
Ruleset planets = new Ruleset (4.141884, 102.69633, -0.6042719, 0.04058671);
Ruleset stf = new Ruleset (0.271, 5, -0.418879, 0.0872665);
