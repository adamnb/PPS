float zoomSpeed = 0.1;
void mouseWheel (MouseEvent event) {
  float e = event.getCount();
  zoom += e*zoomSpeed;
}

Vector dMouse = new Vector (0, 0);
void mouseDragged () {
  if (mouseButton == LEFT) {
    mOffset.x += dMouse.x/2;
    mOffset.y += dMouse.y/2;
  }
}  
