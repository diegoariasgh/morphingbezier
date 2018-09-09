float xOff=0;
float yOff=0;

void setup() {
  size (1000, 600);
  smooth();
  noFill();
}

void draw() {
 //add 2 dimensional noise;
  loadPixels();
  yOff = 0;
  for (int y=0; y<height; y++) {
    yOff+=.001;
    xOff=0;
    for (int x=0; x<width; x++) {

      float brightness = noise(xOff, yOff)*255;
      xOff+=.008;
      int loc = x + y *width;
      pixels[loc] = color(brightness);
    }
  }
  updatePixels();
  
  stroke(0);
  fill(55);
  rect(0, height/2, width, height);
  
  float t = frameCount/100.0;
  float t2 = frameCount/140.0;
  float t3 = frameCount/190.0;
  stroke(0); 
  noFill();

  //first moving tree
  for (int i = 0; i < 30; i++) {
    bezier(500, height, 
      width/2, noise(2, i, t)*height, 
      noise(3, i, t)*width, noise(4, i, t)*height, 
      noise(5, i, t)*width, noise(6, i, t)*height);
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
      noise(2, i, t3)*width/2, noise(3, i, t3)*height);
  }
  popMatrix();

}