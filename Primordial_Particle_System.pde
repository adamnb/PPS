Field ParticleField;

float curZoom = 1;
float zoom = 1;
Vector offset = new Vector (0);
Vector mOffset = new Vector (0);

void setup () {
  size(1000, 1000);
  frameRate(120);

  ParticleField = new Field (2000, random (1, 20), random (10, 100), random(-PI, PI), random(-PI, PI));
}

void draw () { 
  curZoom = lerp(curZoom, zoom, 0.1);
  offset.x = ((1-curZoom)*width/2) + mOffset.x;
  offset.y = ((1-curZoom)*height/2) + mOffset.y;
  
  dMouse.x = mouseX-pmouseX;
  dMouse.y = mouseY-pmouseY;
    
  background (0);
  
  pushMatrix ();
  translate(offset.x, offset.y);
  scale (curZoom);
  
  stroke(255);
  noFill();
  rect(1,1,width-2, height-2);
  ParticleField.display(false,false);
  
  popMatrix();
  
  ParticleField.step();
}
