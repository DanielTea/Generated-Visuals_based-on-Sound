class Wanderer
{
 float x;
 float y;
 float wander_theta;
 float wander_radius;
 
 // bigger = more edgier, hectic
 float max_wander_offset = summe2/10;
 // bigger = faster turns
 float max_wander_radius = 50.5;
 
 Wanderer(float _x, float _y, float noise)
 {
   x = _x;
   y = _y;
   
   wander_theta = noise(TWO_PI+noise);
   wander_radius = noise(max_wander_radius+noise);
 }
    
 
 void stayInsideCanvas()
 {
  if (x < 0) {
     x += width;
   }
   else {
   x = x % width;
   }
   
   //println(x);
   if (y < 0) {
     y += height;
   }
   else{
   y = y % height;
   }
   //print(y);
 }
 
 void move(float noise)
 {
   float wander_offset = random (-1, 1) * noise(noise * max_wander_offset);
   wander_theta += wander_offset;
   
   x += cos(wander_theta)*noise(noise)*(summe2*0.5);
   y += sin(wander_theta)*noise(noise)*(summe2*0.5);
 }
 
 float getX()
 {
   return x;
 }
 
 float getY()
 {
   return y;
 }
}