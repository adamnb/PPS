Field ParticleField;
Ruleset rules;

boolean PAUSED = true;
boolean CAPTURE = false;

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
  
  curZoom = lerp(curZoom, zoom, 0.2);
  resetOffset();
  
  //println(curZoom);
  
  dMouse.x = mouseX-pmouseX;
  dMouse.y = mouseY-pmouseY;
    
  //background (color(0,0,0,0));
  fill(0,0,0);
  rect (0,0,width,height);
  
  pushMatrix ();
  translate(offset.x, offset.y);
  scale (curZoom);
  
  ParticleField.display();
  
  stroke(255);
  noFill();
  rect(1,1,width-2, height-2);
  
  fill(255);
  textAlign(LEFT, TOP);
  textSize(30);
  text(ParticleField.getRules().toString(), width+30, 0);
  
  popMatrix();
  
  
  if (!PAUSED) { 
    if (CAPTURE) 
      capture();
    ParticleField.step();
  }
  else { 
    text ("PAUSED",  5, 5);
  }
}

void resetOffset () {
  offset.x = ((1-curZoom)*width/2) + mOffset.x;
  offset.y = ((1-curZoom)*height/2) + mOffset.y;
}
