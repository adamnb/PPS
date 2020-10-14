float sign (float n) {
  if (n==0)
    return 0; 
  return n/abs(n);
}

float unwind (float angle) {
  //return (2*PI + (angle + 2*PI)) % 2*PI; 
  return angle- floor(angle/(2*PI)) * 2 * PI;
}
