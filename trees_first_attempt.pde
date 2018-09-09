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

  //first moving tree
  for (int i = 0; i < 30; i++) {
    bezier(width/2, height, 
      width/2, noise(1, i, t)*height, 
      noise(2, i, t)*width, noise(3, i, t)*height, 
      noise(4, i, t)*width, noise(5, i, t)*height);
  }  
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
  translate(3*width/5, height*6/5);  // move origin to center of object
  rotate(radians(220)); // rotate about the origin
  for (int i = 0; i < 30; i++) {
    bezier(0, 0, 
      0, noise(1, i, t3), 
      noise(2, i, t3)*width*3/2, noise(3, i, t3)*height*(6/5), 
      noise(4, i, t3)*width*3/2, noise(5, i, t3)*height*(6/5));
  }
  popMatrix();
}





/*for (int k = 0; k < 30; k++) {
 bezier(0, 0, 
 width/2, noise(1, k, t), 
 noise(1, k, t)*width, noise(3/2, k, t)*height, 
 noise(2, k, t)*width, noise(5/2, k, t)*height);
 //bezier(width/3, height/3, width/2, noise(5, i), noise(6, i)*width, noise(7, i)*height, noise(8, i)*width, noise(5, i)*height);
 */