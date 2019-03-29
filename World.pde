

class World{
   int rad;
  ArrayList<Fish> fishes;
  ArrayList<Food> food;
   float xdirection, ydirection, xpos, ypos;
  
  World(int num){
    
    rad = 60;
    food = new ArrayList<Food>();
   xdirection = random(1);
   ydirection = random(1);
  
   xpos = random(width-rad);
   ypos = random(height-rad);
    
    
    ellipseMode(rad);
    fishes = new ArrayList<Fish>();
    
    for(int i = 0 ; i < num ; i++){
        PVector l = new PVector(random(width),random(height));
        DNA dna = new DNA();
        fishes.add(new Fish(l,dna));
    
    }
  }
  
  void run(){
  
    
  for(int i = 0 ; i < food.size() ; i++){
    Food ff = food.get(i);
    //println(ff.Xdim);
    ff.run();
  }
   
   ////////////// my analysis
   
   int m,fe;
   
   m = fe = 0;
   for(int i = 0 ; i < fishes.size() ; i++){
     if(fishes.get(i).dna.gene[5] == 1)m++;
     else  fe++;
   }
   
   println(m);
   println(fe);
   //////////////////
  for(int i = 0 ; i < fishes.size() ; i++){
    
    Fish f = fishes.get(i);
    f.run();
    f.eat(food);
    
    Fish child = f.reproduce(fishes.get(int(random(fishes.size()-1))));
    if(child != null)fishes.add(child);
    
    if(f.dead()){
      fishes.remove(i);
      addFood(f.position.x,f.position.y);
     }
   
 }
  
  }
  
  void addFood(float x,float y){
    
    food.add(new Food(x,y));
  }
  
  
}
