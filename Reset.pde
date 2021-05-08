class Reset {
  void reset() {
    for (int i = 0; i < n; i++) { //Resets Objects Randomly
      m[i] = randomGaussian() * 16;
      x[i] = random(width);
      y[i] = random(height);
    }

    for (int i = 0; i < n; i++) { 
      m[i] = randomGaussian() * 8;
      x[i] = random(width);
      y[i] = random(height);
      shape [i] = random(0, 3);
    }
  }
}
