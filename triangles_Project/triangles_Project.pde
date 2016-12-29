  String filename = "test.mp3";
  float a = 0;

  int i = 0;
  float yy = 0;
  float xx = 0;
  int z = 0;
  
  float addx = 250;
  float addy = 200;
  
  int rd = 0;
  float noiserd = 0;
  float noise = 0;
  float noise2 = 0;
  
  float summe;
  float summe2;
  float summe3;
  
  float x;
  float y;
  
  int anzahl = 40;
  
  String path;
  String pathsound;

void setup(){
size(1000, 1000, P3D);


  setWanderer(anzahl);

  device = new AudioDevice(this, 44000, bands);

  // Calculate the width of the rects depending on how many bands we have
  r_width = width/float(bands);

  // Load and play a soundfile and loop it. This has to be called 
  // before the FFT is created.
  path = sketchPath("");
  pathsound = path + filename;
  sample = new SoundFile(this, pathsound);
  sample.loop();

  // Create and patch the FFT analyzer
  fft = new FFT(this, bands);
  fft.input(sample);

}


void draw(){
background(51,0,25);
  // changing Position
  
  runTri(anzahl);
  
  
  
}