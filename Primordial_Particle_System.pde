Field ParticleField;
Ruleset rules;

float curZoom = 1;
float zoom = 1;
Vector offset = new Vector (0);
Vector mOffset = new Vector (0);

void setup () {
  background(0);
  size(1000, 1000);
  frameRate(120);

  //rules = new Ruleset (random (1, 20), random (2, 100), PI/6, PI);
  rules = tmk;
  //rules = stf;
  //rules = planets;
  ParticleField = new Field (2000, rules);
}

void draw () {
  
  curZoom = lerp(curZoom, zoom, 0.1);
  offset.x = ((1-curZoom)*width/2) + mOffset.x;
  offset.y = ((1-curZoom)*height/2) + mOffset.y;
  
  dMouse.x = mouseX-pmouseX;
  dMouse.y = mouseY-pmouseY;
    
  //background (color(0,0,0,0));
  fill(0,0,0);
  rect (0,0,width,height);
  
  pushMatrix ();
  translate(offset.x, offset.y);
  scale (curZoom);
  
  ParticleField.display(false, false);
  
  stroke(255);
  noFill();
  rect(1,1,width-2, height-2);
  
  fill(255);
  textAlign(LEFT, TOP);
  textSize(30);
  text(rules.toString(), width+30, 0);
  
  popMatrix();
  
  capture();
  
  ParticleField.step();
}
