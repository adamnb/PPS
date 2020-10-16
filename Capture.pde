final int TOTAL_FRAMES = 150;
final int FRAME_SKIP = 1;
void capture () {
  if (ParticleField.t < TOTAL_FRAMES) {
    if (ParticleField.t % FRAME_SKIP == 0) {
      saveFrame("frames/###.tiff");
    }
  }
}
