float zoomSpeed = 0.1; 
void mouseWheel (MouseEvent event) {
  float e = event.getCount();
  zoom += e*zoomSpeed*zoom;
  zoom = constrain(zoom, 0.1, 10);
}

Vector dMouse = new Vector (0, 0);
void mouseDragged () {
  if (mouseButton == LEFT) {
    mOffset.x += dMouse.x/2;
    mOffset.y += dMouse.y/2;
  }
}

void keyPressed () {
  switch (key) {
   case 'p' : PAUSED = !PAUSED; break;
   case 'r' :
     Field newField = new Field(ParticleField.getSize(), ParticleField.getRules());
     ParticleField = newField;
     break;
   case 'c': // this should recenter but it doesn't work fml
     resetOffset();
     break;
  }
}
