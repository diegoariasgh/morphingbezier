void setup() {
  size (1000, 600);
  smooth();
  noFill();
}

void draw() {
  background(255);
  float t = frameCount/100.0;
  float t2 = frameCount/140.0;
  float t3 = frameCount/190.0;
  fill( random(255), random(255), random(255), random(255)); 

  //first moving tree
  for (int i = 0; i < 30; i++) {
    bezier(width/2, height, 
      width/2, noise(1, i, t)*height, 
      noise(2, i, t)*width, noise(3, i, t)*height, 
      noise(4, i, t)*width, noise(5, i, t)*height);
  }  
  //take the model of the first tree, use it 
  //second moving tree, using the matrix push to re-locate starting point
  pushMatrix();
  translate(width/5, height*4/5);  // move origin to center of object
  rotate(radians(220)); // rotate about the origin
  for (int i = 0; i < 30; i++) {
    bezier(0, 0, 
      20, noise(3, i, t2)*height/2, 
      noise(1, i, t2)*width/2, noise(2, i, t2)*height, 
      noise(3, i, t2)*width/2, noise(4, i, t2)*height);
  }
  popMatrix();
  
  //third moving tree, using the matrix push to re-locate starting point
  pushMatrix();
  translate(4*width/5, height*6/7);  // move origin to center of object
  rotate(radians(200)); // rotate about the origin
  for (int i = 0; i < 40; i++) {
    bezier(0, 0, 
      20, noise(3, i, t3)*height/2, 
      noise(1, i, t3)*width/2, noise(2, i, t3)*height, 
      noise(3, i, t3)*width/2, noise(4, i, t3)*height);
  }
  popMatrix();

}