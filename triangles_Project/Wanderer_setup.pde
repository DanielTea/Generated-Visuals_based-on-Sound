ArrayList<Wanderer[]> wandererList = new ArrayList();
ArrayList<Triangle> triangleList = new ArrayList();
  
void setWanderer(int Anzahl){
  
  for (int i =0; i < Anzahl; i++){
 
    Wanderer[] wanderer = new Wanderer[1];
    wandererList.add(wanderer);
    Triangle triangle = new Triangle(wandererList.get(i));
    triangleList.add(triangle); 

   }
  
  
for(int i2 = 0; i2 < wandererList.size(); i2++){
  
  for (int in =0; in < wandererList.get(i2).length; in++)
     {
   
     wandererList.get(i2)[in] = new Wanderer(noise(width*noise), noise(height*noise), noise);
     noise = noise + 0.01;
     }

  println(wandererList.size());
}

}

void runTri(int Anzahl){
  
  for(int in = 0; in < triangleList.size(); in++){
      triangleList.get(in).run();      
    }
  
  
}