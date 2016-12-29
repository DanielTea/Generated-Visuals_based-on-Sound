class Triangle
{
  Wanderer[] wanderer;
  
  
  Triangle(Wanderer[] wanderer){
    this.wanderer = wanderer;
    
  }

void run(){
for (int ind=0; ind<wanderer.length; ind++)
 {

   wanderer[ind].stayInsideCanvas();
   wanderer[ind].move(noise2);
   
   fft.analyze(); 
   sum[3] += (fft.spectrum[3] - sum[3])*smooth_factor;
   sum[8] += (fft.spectrum[8] - sum[8])*smooth_factor;
  
   summe = abs(sum[3])*350;
   summe2 = abs(sum[8])*350;
   
stroke(255);
lights();

x=wanderer[ind].getX();
y=wanderer[ind].getY(); 

//println(x);

pushMatrix();
translate(x,y, 0);
a = a + 0.01;

rotateX(wanderer[ind].getX()*0.03);
rotateY(wanderer[ind].getX()*0.03);

beginShape(QUADS);
 
//noFill();

beginShape();
vertex(-50, -50, -50);
vertex( 50, -50, -50);
vertex(   0,    0,  50);

vertex( 50, -50, -50);
vertex( 50,  50, -50);
vertex(   0,    0,  50);

vertex( 50, 50, -50);
vertex(-50, 50, -50);
vertex(   0,   0,  50);

vertex(-50,  50, -50);
vertex(-50, -50, -50);
vertex(   0,    0,  50);

endShape();

popMatrix();
}
}
}