  String filename = "test.mp3";
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
  
  String path;
  String pathsound;
  
  Wanderer[] wanderer = new Wanderer[1];
  Wanderer[] wanderer2 = new Wanderer[1];
  
void setup() {
   
 size(1000, 1000);
 background(10, 80, 100);
 fill(200);
 
  for (int i=0; i<wanderer.length; i++)
 {
   
   wanderer[i] = new Wanderer(noise(width*noise), noise(height*noise), noise);
   noise = noise + 0.01;
 }
 
   for (int i=0; i<wanderer2.length; i++)
 {
   
   wanderer2[i] = new Wanderer(noise(width*noise), noise(height*noise), noise);
   noise = noise + 0.02;
 }
 
  // If the Buffersize is larger than the FFT Size, the FFT will fail
  // so we set Buffersize equal to bands
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

void draw() {

 /* if ((addy > height) || (addy < 0)){
  addy = random(0,500);
  }
  if ((addx > width) || (addx < 0)){
  addx = random(0,500);
  } */

 /* if (z == rd) {
  //background(10, 80, 100);
  fill(10, 80, 100);
  stroke(10, 80, 100);
  ellipse(xx, yy, 70, 70);
  z = 0;
  rd = int(noise(noiserd + 0.2)*60);
  println(rd);
  noiserd = noiserd +1;
  i = 0;
  }*/

  for (int ind=0; ind<wanderer.length; ind++)
 {
   wanderer[ind].stayInsideCanvas();
   wanderer[ind].move(noise2);
   
  fft.analyze(); 
  sum[3] += (fft.spectrum[3] - sum[3])*smooth_factor;
  sum[8] += (fft.spectrum[8] - sum[8])*smooth_factor;
  
  summe = abs(sum[3])*500;
  summe2 = abs(sum[8])*500;
  
  println(summe); 
   
   fill(summe*3, summe/2, summe/3);
   stroke(10, 80, 100);
   ellipse(wanderer[ind].getX(), wanderer[ind].getY(), summe, summe);
   println(wanderer[ind].getY());
   
 }
  
  //-----
    for (int ind=0; ind<wanderer2.length; ind++)
 {
   wanderer2[ind].stayInsideCanvas();
   wanderer2[ind].move(noise2);
   
  fft.analyze(); 
  sum[3] += (fft.spectrum[3] - sum[3])*smooth_factor;
  sum[8] += (fft.spectrum[8] - sum[8])*smooth_factor;
  
  summe = abs(sum[3])*500;
  summe2 = abs(sum[8])*500;
  
  println(summe); 
   
     fill(random(summe*2, summe*3), random(summe*3, summe*4), random(summe, summe*3));
   stroke(10, 80, 100);
   ellipse(wanderer2[ind].getX() , wanderer2[ind].getY() , summe, summe);

 }
 //-------
}