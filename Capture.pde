final int TOTAL_FRAMES = 7200;
final int FRAME_SKIP = 1;
final boolean closeOnFinish = true;

int imageN = 0;

void capture () {
  if (ParticleField.t < TOTAL_FRAMES) {
    if (ParticleField.t % FRAME_SKIP == 0) {
      saveFrame("frames/####.png");
      println("Capturing frame " + imageN+ "/" + TOTAL_FRAMES); 
      imageN++;
    }
  } else {
    if (closeOnFinish) {
      exit();
    }
  }
}
