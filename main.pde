World world ;
float elapse = millis();
PImage img;
void setup(){

  size(1491,750);
  //size(1920,1080);
    //frameRate(50);
    img = loadImage("bg2.jpg");
    
    //size(1023,371);
    //img = loadImage("bg1.jpg");
    background(img);
    world = new World(20);
}

void draw(){
  background(img);
  world.run();
  //println(millis() - elapse);
}

void mousePressed(){
  world.addFood(mouseX,mouseY);
}

void mouseDragged(){
  world.addFood(mouseX,mouseY);
}
